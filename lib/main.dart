import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/firebase_options.dart';
import 'package:flutter_chat_app/screens/%20chat.dart';
import 'package:flutter_chat_app/screens/auth.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "flutterChat",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 63, 17, 177),
        )
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (ctx, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return const SplashScreen();
          // }

          if (snapshot.hasData) {
            return const ChatScreen();
          } else {
            return const AuthScreen();
          }
        }),
    );
  }
}

//1234567 (nmt123@gmail.com)  //nmtnmt

 //firebase flutter sdk
 //flutter pub add firebase_core
 //flutter pub add firebase_auth

 //firebase/build/Authentication and 
 //storage(rule) - flutter pub add firebase_storage/  flutter pub add image_picker
 //cloud firebase - rule [ allow read, write: if request.auth != null;]-(flutter pub add cloud_firestore)
 //(flutter pub add firebase_messaging) engage => message => send text message => copy(token)


 //flutter icon and name
//https://icon.kitchen/
//flutter_launcher_icons 0.9.2
//flutter_icons: android: true ios: true image_path: "assets/logo.png" _background: "#ffffff" adaptive_icon_foreground: "assets/logo_foreground.png"  in pubspec.yaml
// flutter pub get/ flutter pub run flutter_launcher_icons:main in terminal

//name - android/app/src/main/AndroidManifest.xml => android:label = "Name"
//flutter_app_name

//https://www.appicon.co/
//android/app/src/main/res
//ios/runner/assets,xcassets/applcon.appiconset

