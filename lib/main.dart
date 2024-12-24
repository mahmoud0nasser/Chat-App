import 'package:chat_app_th/firebase_options.dart';
import 'package:chat_app_th/screens/chat_screen.dart';
import 'package:chat_app_th/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'LoginScreen': (context) => LoginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        // 'RegisterScreen': (context) => RegisterScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'LoginScreen',
      // home: LoginScreen(),
    );
  }
}
