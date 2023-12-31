import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_books_nus/controllers/auth_controller.dart';
import 'package:library_books_nus/view/homescreen.dart';
import 'package:library_books_nus/view/login_screen.dart';

class Register extends StatelessWidget {
  Register({super.key});

  bool passwordHide = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xffAFB4FF),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xffAFB4FF),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 50),
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Text(
                            "Hello! Register to get started",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.075,
                                  child: TextField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color(0xffffffff),
                                        border: OutlineInputBorder(
                                            borderSide:
                                                const BorderSide(width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        hintText: 'Masukkan Email'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                  'Username',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                                Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.075,
                                  child: TextField(
                                    controller: usernameController,
                                    decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color(0xffffffff),
                                        border: OutlineInputBorder(
                                            borderSide:
                                                const BorderSide(width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        hintText: 'Masukkan Username'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                  'Password',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.5,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.075,
                                    child: TextField(
                                      controller: passwordController,
                                      obscureText: passwordHide,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xffffffff),
                                          border: OutlineInputBorder(
                                              borderSide:
                                                  const BorderSide(width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          hintText: 'Masukkan Password',
                                          suffix: IconButton(
                                            onPressed: () {
                                              // passwordHide = !passwordHide;
                                              if (passwordHide) {
                                                //if passenable == true, make it false
                                                passwordHide = false;
                                              } else {
                                                passwordHide =
                                                    true; //if passenable == false, make it true
                                              }
                                            },
                                            icon: Icon(passwordHide == true
                                                ? Icons.remove_red_eye
                                                : Icons.password),
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                    child: Text(
                                  'Confirm Password',
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 1.5,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.075,
                                    child: TextField(
                                      controller: confirmPasswordController,
                                      obscureText: passwordHide,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xffffffff),
                                          border: OutlineInputBorder(
                                              borderSide:
                                                  const BorderSide(width: 0.5),
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          hintText:
                                              'Masukkan Confirmasi Password',
                                          suffix: IconButton(
                                            onPressed: () {
                                              // passwordHide = !passwordHide;
                                              if (passwordHide) {
                                                //if passenable == true, make it false
                                                passwordHide = false;
                                              } else {
                                                passwordHide =
                                                    true; //if passenable == false, make it true
                                              }
                                            },
                                            icon: Icon(passwordHide == true
                                                ? Icons.remove_red_eye
                                                : Icons.password),
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 160, top: 10),
                          child: Text('Forgot Password ?',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Column(
                            children: <Widget>[
                              Material(
                                borderRadius: BorderRadius.circular(12),
                                color: Color(0xff2B4865),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.95,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: InkWell(
                                    onTap: () {
                                      final username = usernameController.text;
                                      final email = emailController.text;
                                      final password = passwordController.text;
                                      final confirmPassword =
                                          confirmPasswordController.text;
                                      final userData = {
                                        'name': username,
                                        'email': email,
                                        'password': password,
                                        'password_confirmation':
                                            confirmPassword,
                                      };
                                      authController
                                          .registerUser(userData)
                                          .then((_) {
                                        Get.offAll(LoginScreen());
                                      }).catchError((error) {
                                        Get.snackbar('Error', error.toString());
                                      });
                                    },
                                    child: Center(
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xffffffff)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Already have an account? ",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return LoginScreen();
                                        }));
                                      },
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xff2B4865)),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
