import 'package:flutter/material.dart';
import 'package:loginform/screens/authentication/register.dart';
import 'package:loginform/screens/authentication/sign_in.dart';

class Authenticate extends StatefulWidget{
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() {
    return _Authenticate();
  }
}

class _Authenticate extends State<Authenticate>{
  @override
  Widget build(BuildContext context) {
    return Sign_In();
  }
}