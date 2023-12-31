import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_books_nus/controllers/auth_controller.dart';
import 'package:library_books_nus/view/homescreen.dart';
import 'package:library_books_nus/view/register_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  bool passwordHide = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
                            "Welcome back! Glad to see you, Again!",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
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
                                      final email = emailController.text;
                                      final password = passwordController.text;
                                      authController
                                          .loginUser(email, password)
                                          .then((_) {
                                        // Navigasi ke halaman utama setelah login berhasil
                                        Get.offAll(HomeScreen());
                                      }).catchError((error) {
                                        Get.snackbar('Error', error.toString());
                                      });
                                    },
                                    child: Center(
                                      child: Text(
                                        'Login',
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Don’t have an account? ",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(() => Register());
                                      },
                                      child: Text(
                                        'Sign Up',
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
