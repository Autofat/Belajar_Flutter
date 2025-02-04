import 'package:get/get.dart';

class Controller extends GetxController {
  var siswa = 0.obs;
  var guru = 0.obs;

  addKehadiranSiswa() {
    return siswa.value++;
  }

  removeKehadiranSiswa() {
    if (siswa.value > 0) {
      return siswa.value--;
    }
  }

  addKehadiranGuru() {
    return guru.value++;
  }

  removeKehadiranGuru() {
    if (guru.value > 0) {
      return guru.value--;
    }
  }

  sumTotal() {
    return siswa.value + guru.value;
  }
}
