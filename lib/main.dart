import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: HomePage(),
      initialRoute: '/',
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  final CollectionReference _absensiSiswa = FirebaseFirestore.instance
      .collection(
          'absensi'); //Collection diambil dari nama collection dari firebase

  //Create or Update (Melakukan cek action base dari data yang dikasih)
  Future<void> _createOrUpdate(DocumentSnapshot? documentSnapshot) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _namaController.text = documentSnapshot['nama'];
      _statusController.text = documentSnapshot['status'];
    }

    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              TextField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama Mahasiswa',
                ),
              ),
              TextField(
                controller: _statusController,
                decoration: InputDecoration(
                  labelText: 'Status Mahasiswa',
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () async {
                  final String? nama = _namaController.text;
                  final String? status = _statusController.text;

                  if (nama != null && status != null) {
                    if (action == 'create') {
                      await _absensiSiswa.add({
                        "nama": nama,
                        "status": status,
                      });
                    }
                    if (action == 'update') {
                      await _absensiSiswa.doc(documentSnapshot!.id).update({
                        "nama": nama,
                        "status": status,
                      });
                    }

                    _namaController.text = '';
                    _statusController.text = '';

                    Navigator.of(context).pop();
                  }
                },
                child: Text(action == 'create' ? 'Create' : 'Update'),
              )
            ],
          ),
        );
      },
    );
  }

  // Delete
  Future<void> _deleteAbsensi(String absensiID) async {
    await _absensiSiswa.doc(absensiID).delete();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Data berhasil dihapus"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Absensi Mahasiswa - Firebase'),
      ),
      body: StreamBuilder(
          stream: _absensiSiswa.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];

                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['nama']),
                      subtitle: Text(documentSnapshot['status']),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  _createOrUpdate(documentSnapshot);
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  _deleteAbsensi(documentSnapshot.id);
                                },
                                icon: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(null),
        child: Icon(Icons.add),
      ),
    );
  }
}
