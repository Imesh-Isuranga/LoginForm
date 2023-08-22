import 'package:flutter/material.dart';
import 'package:loginform/constant/colors.dart';
import 'package:loginform/constant/styles.dart';
import 'package:loginform/services/auth.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key,required this.toggle});

  final Function toggle;

  @override
  State<Sign_In> createState() => _SignInState();
}

class _SignInState extends State<Sign_In> {
  final AuthServices _auth = AuthServices();

  final _formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgBlack,
      appBar: AppBar(
        title: const Text("Sign In"),
        backgroundColor: bgBlack,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 10),
          child: Column(
            children: [
              const Text(
                "This is description.",
                style: descriptionStyle,
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                  child: Image.asset(
                "assets/man.png",
                height: 200,
                width: 200,
              )),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          decoration: textInputDecoration,
                          validator: (value) => value?.isEmpty == true
                              ? "Enter a valid Email"
                              : null,
                          onChanged: (value) => setState(() {
                            email = value;
                          }),
                        ),
                        const SizedBox(height: 20,),
                        TextFormField(
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: textInputDecoration.copyWith(hintText: "Password"),
                          validator: (value) =>
                              value!.length < 6 ? "Enter a valid Password" : null,
                          onChanged: (value) => setState(() {
                            password = value;
                          }),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Text(error,style: const TextStyle(color: Colors.red,fontSize: 20),),
                        const Text(
                          "Login with social accounts",
                          style: descriptionStyle,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Center(
                            child: Image.asset(
                              "assets/G.png",
                              height: 80,
                              width: 80,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Do not have an account",
                              style: descriptionStyle,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            TextButton(
                              onPressed: () {widget.toggle();},
                              child: Text("REGISTER"),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async{
                            dynamic result = await _auth.signInUsingEmailAndPassword(email, password);
                            if(result==null){
                              setState(() {
                                error="Could not sign in with thoe credential";
                              });
                            }
                          },
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                color: textLight,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    width: 2,
                                    color:
                                        const Color.fromARGB(255, 59, 59, 58))),
                            child: const Center(
                              child: Text("Log In"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () async{
                            await _auth.signInAnonymously();
                          },
                          child: Container(
                            height: 40,
                            width: 200,
                            decoration: BoxDecoration(
                                color: textLight,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    width: 2,
                                    color:
                                        const Color.fromARGB(255, 59, 59, 58))),
                            child: const Center(
                              child: Text("Log AS GUEST"),
                            ),
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}


/*

ElevatedButton(
          onPressed: () async {
            dynamic result = await _auth.signInAnonymously();
            if(result==null){
              print(":error in sign in anonymously");
            }else{
              print("Signed In anonymousy");
            }
          }, child: Text("Sign In Anonymously")),

 */