import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import '../view_model/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return  EasySplashScreen(
        logo: Image.asset(
          "assets/images/logo.jpg",
          scale: 2,
        ),
        title: const Text(
          "Movies",
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
        showLoader: true,
        durationInSeconds: 1,
        );
  }
}