import 'package:blood_doner_getx/db/function/home_controller.dart';
import 'package:blood_doner_getx/db/model/model.dart';
import 'package:blood_doner_getx/screens/edit_person/edit_person.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final HomeController homeController = Get.put(HomeController());

class ListPersons extends StatelessWidget {
  const ListPersons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() {
        if (homeController.persons.isEmpty) {
          return const Center(
            child: Text(
              'No Result',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          );
        } else {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: homeController.persons.length,
            itemBuilder: (context, index) {
              final person = homeController.persons[index];
              return GestureDetector(
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${person.name.toUpperCase()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                        Text(
                          'Age: ${person.age}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                        Text(
                          'Address: ${person.bloodgroup.toUpperCase()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                        Text(
                          'Blood Group: ${person.place.toUpperCase()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                        Text(
                          'Mobile: +91 ${person.mobile}',
                          style: const TextStyle(
                              fontWeight: FontWeight.w900, color: Colors.black),
                        ),
                        Spacer(), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                Get.to(EditPerson(perosn: person));
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                ondelete(person, false);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }

  ondelete(Personmodel perosn, bool back) {
    Get.defaultDialog(
      title: 'Confirm Deletion',
      titleStyle: const TextStyle(fontWeight: FontWeight.bold),
      middleText: 'Are you sure to delete this data',
      middleTextStyle: const TextStyle(fontWeight: FontWeight.bold),
      textConfirm: 'Delete',
      textCancel: 'Cancel',
      radius: 15,
      backgroundColor: Colors.blue[100],
      onConfirm: () {
        homeController.deleteperson(perosn);
        Get.back();
        if (back == true) {
          Get.back();
        }
        Get.snackbar('Deleted', 'Doner details removed', 
            backgroundColor: Colors.red,
            overlayBlur: 1,
            duration: const Duration(seconds: 2));
      },
      onCancel: () {
        Get.back();
      },
    );
  }
}
