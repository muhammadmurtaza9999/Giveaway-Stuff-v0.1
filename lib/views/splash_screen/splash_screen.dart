import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gas/Widgets_common/applogo_widget.dart';
import 'package:flutter_gas/consts/consts.dart';
import 'package:flutter_gas/views/home_screen/home.dart';
import 'package:get/get.dart';

import 'package:flutter_gas/views/auth_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    //creating a method to change screen
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      //using getx
      //Get.to(() => const LoginScreen());

      auth.authStateChanges().listen((User? user) {
         if (user == null && mounted) {
           Get.to(() => const LoginScreen());
         }else{
          Get.to(() => const Home());
         }
       });
    }); // Future.delayed
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: redColor,
        body: Center(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(icSplashBg, width: 300)),
              20.heightBox,
              applogowidget(),
              10.heightBox,
              appname.text.fontFamily(bold).size(22).white.make(),
              10.heightBox,
              appversion.text.white.make(),
              const Spacer(),
              credits.text.white.fontFamily(semibold).make(),
              30.heightBox,
            ],
          ),
        ));
  }
}
