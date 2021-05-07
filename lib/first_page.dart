import 'dart:ffi';

import 'package:flutter/material.dart';

import 'SecondPage.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  )
  );
}

class Register extends StatefulWidget {

  var user;
  Register(this.user);


  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey =GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final FnameController = TextEditingController();
  final LnameController = TextEditingController();
  final numberController = TextEditingController();
  String message='';


  @override
  Void dispose(){
    emailController.dispose();
    nameController.dispose();
    FnameController.dispose();
    LnameController.dispose();
    numberController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    emailController.text=widget.user['email'];
    nameController.text=widget.user['username'];
    FnameController.text=widget.user['first_name'];
    LnameController.text=widget.user['last_name'];
    numberController.text=widget.user['phone'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          margin: EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/image.jpg",),
                ),
                SizedBox(height: 20,),
                Text(widget.user['email'],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.redAccent)),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width:150,
                      child: Text(widget.user['first_name']),
                        ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: 150,
                      child: Text(widget.user['last_name']),
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  width: 300,
                  child: Text(widget.user['username'],textAlign: TextAlign.center,),

                ),
                SizedBox(height: 40,),
                Container(
                  width: 300,
                  child: Text(widget.user['email'],textAlign: TextAlign.center,)
                ),
                SizedBox(height: 40,),
                Container(
                  width: 300,
                  child: Text(widget.user['phone'],textAlign: TextAlign.center,),
                ),
                SizedBox(height: 30,),
                Container(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: new LinearGradient(
                      colors: [Colors.red, Colors.blue],
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  child: FlatButton(
                    onPressed: (
                        ) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage()));
                    },
                    padding:EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Continue", style: TextStyle(color: Colors.black54,
                            fontWeight: FontWeight.bold,fontSize: 20),textAlign: TextAlign.center,),
                      ],
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),


      ),
    );
  }
}
