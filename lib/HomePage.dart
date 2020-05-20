import 'package:flutter/material.dart';
import 'package:github_details/DetailsPage.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController textEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/githublogo.png',width: 200, height: 200, ),
          Padding(
            padding: const EdgeInsets.only(left: 50,right: 50),
            child: TextField(
              
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: 'username',
              ),
              
            ),
          ),
          SizedBox(height: 50,),
          GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      username: textEditingController.text,
                    )
                ));
              },
              child: Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blue,
                
              ),
              child: Center(
                child: Text('Submit', style: TextStyle(fontSize: 20,fontFamily: 'Circular',color: Colors.white), ),
              ),
            ),
          )
        ],
      ),
    );
  }
}