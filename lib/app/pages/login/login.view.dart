import 'package:flutter/material.dart';

import 'package:get/get.dart';

import './login.controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login View'),
        centerTitle: true,
      ),
      body: Center(
        child:  ElevatedButton(
            style: ElevatedButton.styleFrom(primary:Colors.blue),
            onPressed: (){
              /// move all functions to controller
              controller.login();
            },
            child: const Text('Login'),
          ),
      ),
    );
  }
}