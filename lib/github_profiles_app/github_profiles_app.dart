import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ten_apps_challenge/github_profiles_app/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:ten_apps_challenge/github_profiles_app/github_user.dart';

class GithubProfilesApp extends StatefulWidget {
  @override
  _GithubProfilesAppState createState() => _GithubProfilesAppState();
}

class _GithubProfilesAppState extends State<GithubProfilesApp> {
  Future<GithubUser> githubUser;
  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text('GitHub Profiles')),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 18.0, left: 25.0, right: 25.0),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 100,
                  child: new Image.asset('assets/images/octocat.png',),
                ),
                TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  autofocus: true,
                  controller: searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.shade900,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(),
                    ),
                    hintText: 'Search username',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                FutureBuilder<GithubUser>(
                  future: githubUser,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError)
                      return Center(child: Text('User not found'));

                    if (snapshot.data == null) {
                      return Center(
                          child: Text(
                        'Find A User',
                        style: TextStyle(fontWeight: FontWeight.w600,
                        fontSize: 18,
                          color: Colors.grey.shade900
                        ),
                      ));
                    }

                    final user = snapshot.data;
                    return Column(children: [

                      CircleAvatar(
                        backgroundImage: NetworkImage(user.avatarUrl),
                        radius: 70,
                      ),
                      SizedBox(height: 20),
                      Text(
                        user.name,
                        style: TextStyle(
                          fontSize: 40,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '@' + user.login,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Icon(Icons.location_on),
                      Text(
                        user?.location ?? '',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        user.bio,
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                       Padding(
                         padding: const EdgeInsets.only(right: 22.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    Text(
                                      user.publicRepos.toString(),
                                      style: Theme.of(context).textTheme.headline6,
                                    ),
                                    Text(
                                      'Repositories',
                                      style: Theme.of(context).textTheme.headline6,
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    user.following.toString(),
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    'Following',
                                    style: Theme.of(context).textTheme.headline6,
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    user.followers.toString(),
                                    style: Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    'Followers',
                                    style: Theme.of(context).textTheme.headline6,
                                  )
                                ],
                              ),
                            ],
                          ),
                       ),
                    ]);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15,20,10,10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffFE4D3B),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Page2() ),);
                    },
                    child: Text(
                      'About Me',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffFE4D3B),
        onPressed: () {
          setState(() {
            githubUser = fetchGithubUser(searchController.text);
          });
        },
        child: Icon(Icons.search),
      ),
    );
  }
}

Future<GithubUser> fetchGithubUser(String user) async {
  final response = await http.get('https://api.github.com/users/$user');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return GithubUser.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}


