import 'package:blood_doner_getx/db/function/home_controller.dart';
import 'package:blood_doner_getx/db/model/model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddPerson extends StatelessWidget {
  AddPerson({super.key});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final bloodController = TextEditingController();
  final placeController = TextEditingController();
  final mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red[900],
        title: const Center(
            child: Text(
          "ADD PERSON",
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
        )),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: AssetImage('images/wp11201274.webp'),
                                fit: BoxFit.fitWidth)),

                        height: 120,
                        width: double.infinity,
                        // color: Colors.amber,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please eneter the name';
                          }
                          return null;
                        },
                        controller: nameController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.abc),
                            border: OutlineInputBorder(),
                            labelText: 'Name'),
                        textCapitalization: TextCapitalization.words,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please eneter the Age';
                          }
                          return null;
                        },
                        controller: ageController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [LengthLimitingTextInputFormatter(2)],
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.calendar_month),
                            border: OutlineInputBorder(),
                            labelText: 'Age'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please eneter the Blood Group';
                          }
                          return null;
                        },
                        controller: bloodController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.bloodtype),
                            border: OutlineInputBorder(),
                            labelText: 'Blood Group '),
                        textCapitalization: TextCapitalization.words,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please eneter the place';
                          }
                          return null;
                        },
                        controller: placeController,
                        decoration: const InputDecoration(
                          prefixStyle:
                              TextStyle(color: Colors.black, fontSize: 16),
                          suffixIcon: Icon(Icons.place),
                          border: OutlineInputBorder(),
                          labelText: 'Place',
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please eneter the Phone number';
                          }
                          return null;
                        },
                        controller: mobileController,
                        inputFormatters: [LengthLimitingTextInputFormatter(10)],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          prefixStyle:
                              TextStyle(color: Colors.black, fontSize: 16),
                          suffixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                          labelText: 'Mobile',
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 45),
                            backgroundColor: Colors.red[900],
                          ),
                          onPressed: () {
                            submitclick(
                                nameController,
                                ageController,
                                placeController,
                                bloodController,
                                mobileController,
                                formkey,
                                homeController);
                          },
                          icon: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          label: const Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ))
          ],
        )
        ),
      ),
    );
  }

  Future<void> submitclick(
      nameController,
      ageController,
      bloodController,
      placeController,
      mobileController,
      formkey,
      HomeController homeController) async {
    if (formkey.currentState!.validate()) {
      final person = Personmodel(
          nameController.text,
          ageController.text,
          bloodController.text,
          placeController.text,
          mobileController.text,
      );
      homeController.Addperson(person);
      Get.back();
      Get.snackbar(
        "Success",
        "Doner information submitted successfully",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        overlayBlur: 1,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
      );
    } else {
      Get.snackbar(
        "Error",
        "Please fill out all the fields",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        overlayBlur: 1,
        duration: const Duration(seconds: 2),
        dismissDirection: DismissDirection.horizontal,
      );
    }
  }
}
