import 'package:chat_app_th/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants/constants.dart';
import '../helper/show_snack_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({
    super.key,
  });

  // String id = 'RegisterScreen';
  static String id = 'RegisterScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /* Spacer(
                    flex: 2,
                  ), */
                  SizedBox(
                    height: 75.0,
                  ),
                  Image.asset(
                    'assets/images/scholar.png',
                    height: 100.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Scholar Chat',
                        style: TextStyle(
                          fontSize: 32.0,
                          color: Colors.white,
                          fontFamily: 'pacifico',
                        ),
                      ),
                    ],
                  ),
                  /* Spacer(
                    flex: 2,
                  ), */
                  SizedBox(
                    height: 75.0,
                  ),
                  Text(
                    'REGISTER',
                    textAlign: TextAlign.center,
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
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: 'Password',
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          await registerUser();
                          showSnackBar(
                            context,
                            'Created Successfully...',
                            Colors.orange,
                          );
                          Navigator.pushReplacementNamed(
                              context,
                              ChatScreen.id,
                            );
                          // Navigator.pop(context);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackBar(
                              context,
                              'The Password provided is too weak',
                              Colors.red,
                            );
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(
                              context,
                              'The account already exists for that Email',
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
                      /* try {
                        await registerUser();
                        /* var auth = FirebaseAuth.instance;
                        UserCredential user =
                            await auth.createUserWithEmailAndPassword(
                          email: email!,
                          password: password!,
                        ); */
                        showSnackBar(
                          context,
                          'Created Successfullt...',
                          Colors.orange,
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                            context,
                            'The Password provided is too weak',
                            Colors.red,
                          );
                          /* ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.only(
                                top: 30.0,
                                bottom: 30.0,
                              ),
                              content: Text(
                                'The Password provided is too weak',
                                // e.toString(),
                                // 'There was an error, please try again.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ); */
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(
                            context,
                            'The account already exists for that Email',
                            Colors.red,
                          );
                          /* ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.only(
                                top: 30.0,
                                bottom: 30.0,
                              ),
                              content: Text(
                                'The account already exists for that Email',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ); */
                        }
                        /* ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.orange,
                            padding: EdgeInsets.only(
                              top: 30.0,
                              bottom: 30.0,
                            ),
                            content: Text(
                              e.toString(),
                              // 'There was an error, please try again.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ); */
                      } catch (e) {
                        showSnackBar(
                          context,
                          'There was an error, please try again.',
                          Colors.red,
                        );
                      } */
                      // print(user.user!.displayName);
                    },
                    buttonName: 'REGISTER',
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already have an account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          /* Navigator.pushNamed(
                            context,
                            'LoginScreen',
                          ); */
                        },
                        child: Text(
                          '   Login',
                          style: TextStyle(
                            color: Color(0xffC7EDE6),
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  /* Spacer(
                    flex: 6,
                  ), */
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /* void showSnackBar(
    BuildContext context,
    String message,
    Color? color,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        // backgroundColor: Colors.orange,
        padding: EdgeInsets.only(
          top: 30.0,
          bottom: 30.0,
        ),
        content: Text(
          message,
          // 'Created Successfully...',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  } */

  Future<void> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
