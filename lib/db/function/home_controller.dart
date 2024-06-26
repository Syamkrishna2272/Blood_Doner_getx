import 'package:blood_doner_getx/db/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  late final Box<Personmodel> personBox;
  final RxList<Personmodel> persons = <Personmodel>[].obs;

  void onInit() {
    super.onInit();
    personBox = Hive.box<Personmodel>('person_db');
    Getpersons();
  }

  Future<void> Addperson(Personmodel value) async {
    print('add person working');
    final personDB = Hive.box<Personmodel>('person_db');
    await personDB.add(value);
    Get.snackbar('Success', 'Student details saved Successfully',
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal);
  }

  void Getpersons() {
    print('getperson working');
    persons.assignAll(personBox.values.toList());
    personBox.watch().listen((event) {
      persons.assignAll(personBox.values.toList());
    });
  }

  void deleteperson(Personmodel person) {
    personBox.delete(person);
    persons.remove(person);
  }

  updateperson(Personmodel perosn, String name, String age,
      String bloodgroup, String place, String phone) {
     final index=persons.indexWhere((p) => p==perosn);
    if (index != 1) {
      persons[index].name = name;
      persons[index].age = age;
      persons[index].bloodgroup = bloodgroup;
      persons[index].place = place;
      persons[index].mobile = phone;
      persons.refresh();
    }
  }
}
