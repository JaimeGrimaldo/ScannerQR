import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' as convert;

import 'package:prueba_aplicacion/widgets/bottom_camera.dart';

class Page1 extends StatefulWidget {
  Page1({Key? key}) : super(key: key);

  @override
  Pages1 createState() => Pages1();
 }

class Pages1 extends State<Page1> {
   
  int contador  = 0;
  List <Post> lista = [];

  @override
  void initState(){
    super.initState();
    getRequest();
  }
    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
       floatingActionButton: BottomCamera(),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Container(
          child: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: new Text('${index}.- ${lista[index]}'),
                ),
              );
            },
          ),
        )
      );
    }


  
   Future getRequest() async  {
      var url = Uri.parse('https://randomuser.me/api/?results=100');
      final response = await http.get(url);
      final Map<String, dynamic> datos = convert.jsonDecode(response.body);
      
     for(var user in datos['results']){
        final Post ls = Post.fromJson(user["name"]);
        lista.add(ls);
        print(ls);
      } 
      
    }

}

class Post {
  final String title;
  final String first;
  final String last;

  Post({ required this.title, required this.first, required this.last});

 //Map<String,String >json
  Post.fromJson(Map<String,dynamic> json)
  :this.title = json['title']!,
   this.first = json['first'] ?? 'Defaul json',
   this.last =  json['last'] ?? 'Defaul json';

  
  String toString(){
    return '${this.title} ${this.first} ${this.last}';
  }

}