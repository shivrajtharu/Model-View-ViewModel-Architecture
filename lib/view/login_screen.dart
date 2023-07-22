import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Login Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Utils.flushBarErrorMessage("No internet connection", context);
            // Utils.snackBar("No internet connection", context);
            // Utils.toastMessage("click me");
            // Navigator.pushNamed(context, RoutesName.home);
          }, child: const Text("CLick"),
        ),
      )
    );
  }
}
