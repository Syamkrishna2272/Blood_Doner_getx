import 'package:blood_doner_getx/screens/add_person/add_person.dart';
import 'package:blood_doner_getx/screens/list_person/list_person.dart';
import 'package:blood_doner_getx/screens/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: const Center(
          child: Text(
            "BLOOD DONER",
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search());
              },
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ))
        ],
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
            const Flexible(
              flex: 8,
              child: ListPersons(),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.to(
                      AddPerson(),
                    );
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
