import 'package:chat_app_th/constants/constants.dart';
import 'package:chat_app_th/screens/chat_screen.dart';
import 'package:chat_app_th/screens/register_screen.dart';
import 'package:chat_app_th/widgets/custom_button.dart';
import 'package:chat_app_th/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/show_snack_bar.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;

  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Form(
              key: formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Image.asset(
                    'assets/images/scholar.png',
                  ),
                  Text(
                    'Scholar Chat',
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.white,
                      fontFamily: 'pacifico',
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  CustomFormTextField(
                    validate: (data) {
                      if (data!.isEmpty) {
                        return 'Email mustn\'t be Empty';
                      }
                    },
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: 'Email',
                  ),
                  SizedBox(
                    height: 14.0,
                  ),
                  CustomFormTextField(
                    validate: (data) {
                      if (data!.isEmpty) {
                        return 'Password mustn\'t be Empty';
                      }
                    },
                    obsecureText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  CustomButton(
                      buttonName: 'LOGIN',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            await loginUser();
                            showSnackBar(
                              context,
                              'Login Successfully...',
                              Colors.orange,
                            );
                            Navigator.pushReplacementNamed(
                              context,
                              ChatScreen.id,
                              arguments: email,
                            );
                            // Navigator.pop(context);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              showSnackBar(
                                context,
                                'No User found for that email.',
                                Colors.red,
                              );
                            } else if (e.code == 'wrong-password') {
                              showSnackBar(
                                context,
                                'Wrong Password provided for that user.',
                                Colors.red,
                              );
                            }
                          } catch (e) {
                            showSnackBar(
                              context,
                              'There was an error, please try again.',
                              Colors.red,
                            );
                          }
                          setState(() {
                            isLoading = false;
                          });
                        } else {}
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'don\'t have an account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RegisterScreen.id,
                            // 'RegisterScreen',
                          );
                          /* Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          ); */
                        },
                        child: Text(
                          '   Register',
                          style: TextStyle(
                            color: Color(0xffC7EDE6),
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 6,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
