import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loginform/model/UserMode.dart';
import 'package:loginform/services/auth.dart';
import 'package:loginform/wrapper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      value: AuthServices().user,
      initialData: UserModel(uid: ""),
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
