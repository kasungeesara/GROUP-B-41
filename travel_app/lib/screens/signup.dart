// ignore_for_file: unnecessary_const

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

final _firebase = FirebaseAuth.instance;

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final _form = GlobalKey<FormState>();
  var _firstName = "";
  var _lastName = "";
  var _userName = "";
  var _email = "";
  var _password = "";
  var _contactNumber = "";
  var errorMsg = "";
  bool _isAuthenticating = false;

  void _submit() async {
    var isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    setState(() {
      _isAuthenticating = true;
    });

    FocusScope.of(context).unfocus();

    _form.currentState!.save();

    try {
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _email, password: _password);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredentials.user!.uid)
          .set({
        "first-name": _firstName,
        "last-name": _lastName,
        "user-name": _userName,
        "email": _email,
        "contact-number": _contactNumber
      });

      _form.currentState!.reset();
    } on FirebaseAuthException catch (error) {
      if (error.code == "email-already-in-use") {
        errorMsg = "Email adderss is already in use";
      } else if (error.code == "invalid-email") {
        errorMsg = "Email adderss is not valid";
      }

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMsg),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
      return;
    }
    setState(() {
      _isAuthenticating = false;
    });

    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Text(
                "Let's Create your Account",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Outfit-Regular",
                ),
              ),
              const SizedBox(height: 32),
              Form(
                key: _form,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: "First Name",
                              labelStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Outfit-Regular",
                                  color: Color.fromARGB(255, 91, 91, 91)),
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Please enter first name";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _firstName = value!;
                            },
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: TextFormField(
                            expands: false,
                            decoration: const InputDecoration(
                              labelText: "Last Name",
                              labelStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Outfit-Regular",
                                  color: Color.fromARGB(255, 91, 91, 91)),
                              prefixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Please enter last name";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _lastName = value!;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Outfit-Regular",
                            color: Color.fromARGB(255, 91, 91, 91)),
                        prefixIcon: Icon(Icons.edit),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.trim().length < 5) {
                          return "Plaese enter a user name with 6 characters";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _userName = value!;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Outfit-Regular",
                            color: Color.fromARGB(255, 91, 91, 91)),
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            !value.contains("@")) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Outfit-Regular",
                            color: Color.fromARGB(255, 91, 91, 91)),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.trim().length < 5) {
                          "Please enter a password that contains at least 6 characters";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _password = value!;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: "Phone Number",
                        labelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Outfit-Regular",
                            color: Color.fromARGB(255, 91, 91, 91)),
                        prefixIcon: Icon(Icons.call),
                      ),
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.trim().length < 10) {
                          return "Enter a valid phone number";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _contactNumber = value!;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 20),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(text: "I agree to "),
                              TextSpan(
                                  text: "Privacy Policy ",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Outfit-Regular",
                                    color: Color.fromARGB(255, 78, 71, 216),
                                  ).apply(
                                    decoration: TextDecoration.underline,
                                  )),
                              const TextSpan(text: "and "),
                              TextSpan(
                                  text: "Terms of use",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Outfit-Regular",
                                    color: Color.fromARGB(255, 78, 71, 216),
                                  ).apply(
                                    decoration: TextDecoration.underline,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    if(!_isAuthenticating)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.all(17),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor:
                              const Color.fromARGB(195, 14, 192, 106),
                        ),
                        child: const Center(
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Outfit-Regular",
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if(_isAuthenticating)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _submit,
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          padding: const EdgeInsets.all(17),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          backgroundColor:
                              const Color.fromARGB(195, 14, 192, 106),
                        ),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
