import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http_post_method/api.dart';
import 'package:http_post_method/custom_widget.dart';
import 'home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey =GlobalKey<FormState>();
  final emailController = TextEditingController();
  final PasswordController = TextEditingController();
  String message='';
  @override
  Void dispose(){
    emailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,elevation: 0,
      ),
      body: Column(
        children: <Widget>
        [

          HeroImage(imgHeight: MediaQuery.of(context).size.height*0.35
          ),
          Expanded(
              child:ListView(
                children:<Widget>
                [
                  Padding(padding:EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child:Form(key:_formKey,
                    child:Column(
                      children: <Widget>
                      [
                        TextFormField(
                          decoration:InputDecoration(labelText: 'Email',
                          labelStyle: TextStyle(fontSize: 20)),
                          controller: emailController,
                          validator: (value){
                            if(value.isEmpty){
                              return 'Email is not empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10,),
                        TextFormField(
                          obscureText: true,
                          decoration:InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(fontSize: 20)),
                          controller: PasswordController,
                          validator: (value){
                            if(value.isEmpty){
                              return 'Password is not empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>
                          [
                            Text('New User?'),
                            FlatButton(child:Text('SignUp',
                              style: TextStyle(fontSize: 18,color: Theme.of(context).primaryColor),
                            ),
                              onPressed: (){},
                            ),
                          ],
                        ),
                        CustomButton(onBtnPressed: (
                            )async{
                          if(_formKey.currentState.validate()){
                            var email=emailController.text;
                            var password=PasswordController.text;
                            setState(() {
                              message='please Wait....';
                            });
                            var rsp=await loginUser(email, password);
                            print(rsp);
                            if(rsp.containsKey('success')){
                              setState(() {
                                message=rsp['success'].toString();
                              });
                              if(rsp['success']){
                                Navigator.push(context, MaterialPageRoute(builder:(context){
                                  return HomePage(rsp['user']);
                                })
                                );
                              }
                            }else{
                              setState(() {
                                message='Login Failed';
                              });
                            }
                          }
                        },
                            btnText: 'Login'),
                        SizedBox(height: 10,),
                        Text(message),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SocilaIcon(iconname: 'assets/facebook.png',),
                            SizedBox(width: 20,),
                            SocilaIcon(iconname: 'assets/instagram.png',),
                            SizedBox(width: 20,),
                            SocilaIcon(iconname: 'assets/whatsapp.png',),
                            SizedBox(width: 10,),


                          ],
                        ),
                      ],
                    ),
                    )
                  ),
                ],
              )
          ),
        ],
      ),

    );
  }
}
