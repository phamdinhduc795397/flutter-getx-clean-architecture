import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/presentation/controllers/search_user/search_user_controller.dart';

class SearchUserPage extends GetView<SearchUserController> {
  SearchUserPage({Key? key, required this.title}) : super(key: key);
  final String title;
  final textController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return GetX<SearchUserController>(
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
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.search(textController.text);
                      },
                      child: Icon(Icons.search))
                ],
              ),
              Expanded(
                  child: ListView(
                children: controller.users.map((element) {
                  return GestureDetector(
                    child: ListTile(
                      title: Text(element.login ?? ""),
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
