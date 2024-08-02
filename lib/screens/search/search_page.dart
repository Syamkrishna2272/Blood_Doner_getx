import 'package:blood_doner_getx/db/function/home_controller.dart';
import 'package:blood_doner_getx/screens/list_person/details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends SearchDelegate {
  List data = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (controller) {
          List filtered1 = controller.persons;
          final filtered = filtered1
              .where((element) =>
                  element.name.toLowerCase().contains(query.toLowerCase()))
              .toList();
          if (filtered.isEmpty) {
            return const Center(
              child: Text('No searched results',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            );
          }
          if (controller.persons.isNotEmpty) {
            return ListView.builder(
              itemBuilder: (ctx, index) {
                final data = filtered[index];
                String nameval = data.name;
                if ((nameval).contains(query)) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 15),
                    child: Column(
                      children: [
                        Card(
                          elevation: 5,
                          child: ListTile(
                            onTap: () {
                              Get.to(Details(person: data));
                            },
                            title: Text(data.name),
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              },
              itemCount: filtered.length,
            );
          } else {
            return const Center(
              child: Text(
                'No data',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
}
