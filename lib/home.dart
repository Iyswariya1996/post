import 'dart:ffi';

import 'package:flutter/material.dart';

import 'api.dart';
import 'custom_widget.dart';
import 'first_page.dart';
class HomePage extends StatefulWidget {
  var user;
  HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey =GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final FnameController = TextEditingController();
  final LnameController = TextEditingController();
  final numberController = TextEditingController();

  String message='';

  void validate(context){
    if(_formKey.currentState.validate()){
      print("Validated");
      Navigator.push(context, MaterialPageRoute(builder: (context) => Register(widget.user)));
    }else{
      print("Not validate");
    }
  }

  String validateemail(value){

    if(value.isEmpty){
      return "Required";
    }else{
      return null;
    }
  }
  String validateUserName(value){

    if(value.isEmpty){
      return "Required";
    }else{
      return null;
    }
  }
  String validateFname(value){

    if(value.isEmpty){
      return "Required";
    }else{
      return null;
    }
  }
  String validateLname(value) {
    if (value.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }
  String validatenumber(value) {
    if (value.isEmpty) {
      return "Required";
    } else {
      return null;
    }
  }
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,elevation: 0,
        ),
       body: Column(
         children: <Widget>[
           HeroImage(imgHeight: MediaQuery.of(context).size.height*0.25
           ),
           Expanded(
               child:ListView(
                 children: <Widget>[
                  Padding(padding:EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Form(key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: emailController,
                          validator: validateemail,
                          decoration:InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                            labelStyle: TextStyle(fontSize: 20),
                            ),
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: nameController,
                          validator: validateUserName,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.supervised_user_circle_outlined),
                            border: OutlineInputBorder(),
                            labelText: 'UserName',
                            labelStyle: TextStyle(fontSize: 20),
                          ),

                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: FnameController,
                          validator: validateFname,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.drive_file_rename_outline),
                            border: OutlineInputBorder(),
                            labelText: 'FirstName',
                            labelStyle: TextStyle(fontSize: 20),
                          ),

                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: LnameController,
                          validator: validateLname,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.drive_file_rename_outline),
                            border: OutlineInputBorder(),
                            labelText: 'LastName',
                            labelStyle: TextStyle(fontSize: 20),
                          ),

                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          controller: numberController,
                          validator: validatenumber,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            border: OutlineInputBorder(),
                            labelText: 'PhoneNumber',
                            labelStyle: TextStyle(fontSize: 20),
                          ),

                        ),
                        SizedBox(height: 20,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 50,vertical: 5),
                          child: FlatButton(
                            onPressed: (
                                ){

                              validate(context);
                            },
                            padding:EdgeInsets.all(20.0),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                Text("Continue", style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),


                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),

                      ],
                    ),

                  ),
                  ),
                 ],
               ),
           ),
         ],
       ),
    );
  }
}

