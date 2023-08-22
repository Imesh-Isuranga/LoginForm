import 'package:flutter/material.dart';
import 'package:loginform/model/UserMode.dart';
import 'package:loginform/screens/authentication/authenticate.dart';
import 'package:loginform/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel?>(context);
    if(user==null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}