import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:spotify/demo/demo1.dart';
import 'package:spotify/form/form%20builder.dart';

class splash extends StatefulWidget {
  String? username;
  String? password;
  String? genderselected;
  String? info;
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final timer = Timer(Duration(seconds: 3), () {
      setState(() {
        if (widget.username == null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => form()),
              (route) => false);
        } else {
          
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Demo(gender: '', password: '', username: '',)),
              (route) => false);

        }
      });

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => form()), (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        SizedBox(
          height: 300,
        ),
        Center(
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1611339555312-e607c8352fd7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"),
            radius: 80,
          ),
        )
      ]),
    );

//         child: Column(
//       children: [
//         SizedBox(height: 300,),
//         const Center(
//           child: CircleAvatar(
//             backgroundImage: AssetImage("assets/logo.jpg"),radius: 50,
//           ),

//         )
//       ],
//     ));
  }
}
