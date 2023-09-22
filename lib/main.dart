import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'consts/consts.dart';
import 'views/splash_screen/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        iconTheme: const IconThemeData(),
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
            //set app bar icon color
            // iconTheme: const IconThemeData(),
            // color: darkFontGrey,
            //set elevation
            elevation: 0.0,
            backgroundColor: Colors.transparent),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
