import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(

        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Feed Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                SecondScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}
class SecondScreen extends StatefulWidget {



  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {

  List<String> usernames = ["John Doe","Richard Maxpark","Richmond greens","Natasha Williams","Subrat Rai","Swara Bhaskar"];
  List<String> chattext = ["Yeah man! I'm coming..","How are you doing??","See you tomorrow","Let's have a meet","You ready?","See you.."];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Chat Screen")),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return GestureDetector(

            onTap: (){
              print("hello");
            },

            child: Padding(
              padding: EdgeInsets.only(top: 20.0,left: 20.0),
              child: Container(

                alignment: Alignment.topLeft,

                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(usernames[index],style:
                            TextStyle(
                              fontWeight: FontWeight.bold,
                            ),),
                          Text(chattext[index]),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}
