import 'package:flutter/material.dart';
import 'package:loginform/constant/colors.dart';
import 'package:loginform/constant/styles.dart';
import 'package:loginform/services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthServices _auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(backgroundColor: bgBlack, actions: [
        ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(bgBlack),
          ),
          onPressed: () async {
            await _auth.signOut();
          },
          child: Icon(Icons.logout),
        )
      ]),
      body: const Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
            child: Column(
          children: [
            SizedBox(height: 30,),
            Text(
              "Home",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 30,),
            Text("This is Description",style: TextStyle(fontSize: 10,fontWeight: FontWeight.w300,color: textLight),)
          ],
        )),
      ),
    ));
  }
}
