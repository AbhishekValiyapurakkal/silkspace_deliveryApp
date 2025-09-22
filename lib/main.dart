import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:silkspace_delivery/api_services/firebase_options.dart';
import 'package:silkspace_delivery/presentation/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}

// class First extends StatefulWidget {
//   const First({super.key});

//   @override
//   State<First> createState() => _FirstState();
// }

// class _FirstState extends State<First> {
//   bool finalstate = false;
//   Future getloginstate() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     bool? state = preferences.getBool('login');
//     setState(() {
//       finalstate = state!;
//     });
//   }

//   @override
//   void initState() {
//     getloginstate().whenComplete(
//       () {
//         if (finalstate == false) {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const Loginpage(),
//               ));
//         } else {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const btmnav(),
//               ));
//         }
//       },
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
