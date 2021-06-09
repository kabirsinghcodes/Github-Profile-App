import 'package:flutter/material.dart';
import 'package:ten_apps_challenge/github_profiles_app/github_profiles_app.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      home: GithubProfilesApp(),
    );
  }
}
