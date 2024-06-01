import 'package:blood_doner_getx/screens/add_person/add_person.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(
          child: Text(
            "BLOOD DONER",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage(
                      'images/blood-donation-wallpaper-thumb.jpg',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Flexible(
              flex: 8,
              child: Container(
                  // color: Colors.amber,
                  // child: ListStudents(),
                  ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.to(AddPerson());
                  },
                  icon: const Icon(Icons.bloodtype_rounded),
                  label: const Text("Add"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
