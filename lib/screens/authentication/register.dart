import 'package:flutter/material.dart';
import 'package:loginform/constant/colors.dart';
import 'package:loginform/constant/styles.dart';
import 'package:loginform/services/auth.dart';

class Register extends StatefulWidget {
  const Register({super.key,required this.toggle});

  final Function toggle;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
        title: const Text("Register"),
        backgroundColor: bgBlack,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10),
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
                        const SizedBox(height: 20,),
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
                        Text(error,style: TextStyle(color: Colors.red,fontSize: 20),),
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
                              onPressed: (){widget.toggle();},
                              child: Text("LOGIN"),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () async{
                            dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                            if(result==null){
                              setState(() {
                                error="Please enter a valid email!";
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
                              child: Text("REGISTER"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
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
