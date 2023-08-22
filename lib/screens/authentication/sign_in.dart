import 'package:flutter/material.dart';
import 'package:loginform/services/auth.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _SignInState();
}

class _SignInState extends State<Sign_In> {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: ElevatedButton(
          onPressed: () async {
            dynamic result = await _auth.signInAnonymously();
            if(result==null){
              print(":error in sign in anonymously");
            }else{
              print("Signed In anonymousy");
            }
          }, child: Text("Sign In Anonymously")),
    );
  }
}
