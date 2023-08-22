import 'package:flutter/material.dart';
import 'package:loginform/constant/colors.dart';

const TextStyle descriptionStyle = TextStyle(
  fontSize: 16,
  color:textLight,
  fontWeight: FontWeight.w200
);


const textInputDecoration = InputDecoration(
                          hintText: "Email",
                          fillColor: bgBlack,
                          hintStyle: TextStyle(color: textLight),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 163, 163, 163),width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          ),focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color.fromARGB(255, 163, 163, 163),width: 1),
                            borderRadius: BorderRadius.all(
                              Radius.circular(100),
                            ),
                          )
                        );