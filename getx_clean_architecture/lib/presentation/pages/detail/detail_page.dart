import 'package:flutter/material.dart';
import 'package:getx_clean_architecture/domain/entities/repo.dart';
import 'package:getx_clean_architecture/domain/entities/user.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key, this.repo, this.user}) : super(key: key);

  Repo? repo;
  User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail")),
      body: Column(
        children: [
          if (repo != null)
            Text(repo?.fullName ?? "")
          else
            Text(user?.login ?? "")
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
