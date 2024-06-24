import 'dart:convert';
import 'package:androidapis/services/user_api.dart';
import 'package:http/http.dart' as http;
import 'package:androidapis/models/user.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {

  List<User> users= [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Hello! Let's Begin", style: TextStyle(color: Colors.white),),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context,index){
            final user=users[index];
            final email = user.email;
            final phone = user.phone;
            return ListTile(
              title:  Text(user.fullName),
              subtitle: Text(user.phone),
              // tileColor: color,
        );
      }),
      floatingActionButton: FloatingActionButton(onPressed: fetchUsers),
    );
  }
  Future <void> fetchUsers()async{
   final response =await UserApi.fetchUsers();
   setState(() {
     users= response;
   });
  }

  // Future <void> fetchUsers() async{
  //   print('fetchusers called');
  //   const url = 'https://randomuser.me/api/?results=100';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final results =json['results'] as List<dynamic>;
  //   final transformed =results.map((e){
  //     final name = UserName(
  //         title: e['name']['title'],
  //         first: e['name']['first'],
  //         last: e['name']['last'],
  //     );
  //     return User(
  //       cell: e['cell'],
  //       email: e['email'],
  //       gender: e['gender'],
  //       nat: e['nat'],
  //       phone: e['phone'],
  //       name: name,
  //     );
  //   }).toList();
  //   setState(() {
  //     users= transformed;
  //   });
  //   print("fetchusers completed");
  // }
}

