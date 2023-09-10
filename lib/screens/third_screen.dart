import 'package:first_project/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/Users.dart';
import 'home_page.dart';

class ThirdScreen extends StatefulWidget {

    final String text;
    ThirdScreen(String text): this.text = text;

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {

  Future<List<User>> getUsers() async{
    var url = Uri.parse('https://randomuser.me/api/');
    late http.Response response;

    List<User> users = [];

    try{
      response = await http.get(url);
      if(response.statusCode == 200){

        Map peopleData = jsonDecode(response.body);
        List<dynamic> people = peopleData["results"];

        for (var item in people){
          var email = item['email'];
          var name = item['name']['first'] + " " + item['name']['last'];
          var id = item['login']['uuid'];
          var avatar = item['picture']['large'];
          User user = User(id,name,email,avatar);
          users.add(user);
        }

      }else{
        return Future.error("Something gone wrong, ${response.statusCode}");
      }
    }catch(e){
      return Future.error(e.toString());
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third page"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context, MyHomePage());
          },
        ),
      ),
      body: FutureBuilder(future: getUsers(),builder:(BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.connectionState  == ConnectionState.waiting){
          return const Center(
            child: Text('Waiting'),
          );
        } else{
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          } else{
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data[index].avatar),
                  ),
                  title: Text(snapshot.data[index].avatar),
                  subtitle: Text(snapshot.data[index].email),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                        UserDetail(snapshot.data[index]),
                      )
                    );
                  },
                );
              });
          }
        }
      },),
    );
  }
}

