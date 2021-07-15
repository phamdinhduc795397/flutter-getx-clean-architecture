import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/presentation/controllers/search_repo/search_repo_controller.dart';

class SearchRepoPage extends GetView<SearchRepoController> {
  SearchRepoPage({Key? key, required this.title}) : super(key: key);
  final String title;
  final textController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return GetX<SearchRepoController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Column(
            children: [
              Row(
                children: [
                  Flexible(
                      child: TextField(
                    controller: textController,
                  )),
                  TextButton(
                      onPressed: () {
                        controller.search(textController.text);
                      },
                      child: Icon(Icons.search))
                ],
              ),
              Expanded(
                  child: ListView(
                children: controller.repos.toList().map((element) {
                  return GestureDetector(
                    child: ListTile(
                      title: Text(element.fullName ?? ""),
                    ),
                    onTap: () {
                      controller.navigateDetai(element);
                    },
                  );
                }).toList(),
              ))
            ],
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      },
    );
  }
}
