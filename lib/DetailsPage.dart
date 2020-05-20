import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;


class DetailsPage extends StatefulWidget {

  final String username;

  DetailsPage({this.username});


  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {



  Map userData;
  searchUser(String user) async {
      var response = await http.get("https://api.github.com/users/$user");
      setState(() {
        userData = json.decode(response.body);
        
      });
  }

  @override
  void initState() {
    searchUser(widget.username);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: userData == null ? Center(child: CircularProgressIndicator(),) : SafeArea(
        child: SingleChildScrollView(
          
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage('${userData['avatar_url']}'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              Center(child: Text(userData['name'], style: TextStyle(fontFamily: 'Circular',fontWeight: FontWeight.bold, fontSize: 25), )),
              SizedBox(height: 20,),
              Center(child: Text(userData['location'], style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.black54),)),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: <Widget>[
                    
                    Column(
                      children: <Widget>[
                        Icon(Icons.folder),
                        SizedBox(height: 10,),
                        Text(userData['public_repos'].toString()),
                        SizedBox(height: 10,),
                        Text('Repositories', style: TextStyle(fontSize: 10, fontFamily: 'Circular', color: Colors.black54), ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.folder_open),
                        SizedBox(height: 10,),
                        Text(userData['public_repos'].toString()),
                        SizedBox(height: 10,),
                        Text('Gists', style: TextStyle(fontSize: 10, fontFamily: 'Circular', color: Colors.black54), ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.person_pin),
                        SizedBox(height: 10,),
                        Text(userData['followers'].toString()),
                        SizedBox(height: 10,),
                        Text('Followers', style: TextStyle(fontSize: 10, fontFamily: 'Circular', color: Colors.black54), ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.people),
                        SizedBox(height: 10,),
                        Text(userData['following'].toString()),
                        SizedBox(height: 10,),
                        Text('Following', style: TextStyle(fontSize: 10, fontFamily: 'Circular', color: Colors.black54), ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Bio", style: TextStyle(fontSize: 30, fontFamily: 'Circular', fontWeight: FontWeight.bold), ),
                    SizedBox(height: 10),
                    Text(userData['bio'], style: TextStyle(color: Colors.black54, fontFamily: 'Circular'), )
                  ],
                ),
              )
            ],
          ),
          
        ),
      ),
    );
  }
}