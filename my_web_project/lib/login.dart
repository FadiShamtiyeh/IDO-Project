import 'package:flutter/material.dart';
//import 'package:my_web_project/crud.dart';
import 'package:my_web_project/component/login/mytext.dart';
import 'package:my_web_project/component/login/mytextfield.dart';
//import 'package:my_web_project/constant/linkapi.dart';

import 'package:my_web_project/todo.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = GlobalKey();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  // Crud crud = Crud();

  //Crud crud = Crud();

  /*login() async {
    if (formstate.currentState!.validate()) {
      var reponse = await crud.postRequest(
        linkLogin,
        {
          'email': _emailController.text,
          'password': _passwordController.text,
        },
      );
      if (reponse['status'] == 'success') {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const ToDo(),
          ),
          (route) => false,
        );
      }
    }
  }*/

  login() {
    if (formstate.currentState!.validate()) {
      // Perform your login logic here
      if (_emailController.text == 'fadi@gmail.com' &&
          _passwordController.text == 'fadi2024') {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const ToDo(),
          ),
          (route) => false,
        );
      }
    }
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // to get the size of the screen
    RegExp emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                // Background Image
                Positioned.fill(
                  child: Image.asset(
                    'images/background.png',
                    fit: BoxFit.cover,
                  ),
                ),
                // Image in the middle
                Positioned(
                  top: size.height / 8,
                  left: size.width / 8,
                  right: size.width / 7,
                  bottom: size.width / 3.5,
                  child: Image.asset(
                    'images/logo.png',
                    width: size.width / 3,
                    height: size.height / 3,
                  ),
                ),
                // Image in the bottom left corner
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    'images/woman.png',
                  ),
                ),
                // Image in the bottom right corner
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'images/man.png',
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromRGBO(133, 86, 164, 1),
                    Color.fromRGBO(45, 43, 82, 1),
                  ],
                ),
              ),
              child: Form(
                key: formstate,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 8,
                      ),
                      height: 81.0,
                      child: const Text(
                        'Time to work!',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 72.0,
                          fontFamily: 'HelveticaNeue',
                          fontWeight: FontWeight.w100,
                          letterSpacing: 0.0,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                    const CustomText(
                      text: 'Email',
                      number: 12,
                    ),
                    CustomTextField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        if (!emailRegex.hasMatch(value)) {
                          return 'Invalid email format';
                        }
                        if (value != 'fadi@gmail.com') {
                          return 'Invalid email';
                        }

                        return null;
                      },
                    ),
                    const CustomText(
                      text: 'Password',
                      number: 50,
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      obscure: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a value';
                        }
                        if (_emailController.text.isNotEmpty &&
                            value != 'fadi2024') {
                          return 'Invalid password';
                        }
                        return null;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: size.height / 12,
                        left: size.width / 150,
                      ),
                      width: 415,
                      height: 30,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        onPressed: () {
                          login();
                        },
                        color: const Color.fromRGBO(182, 163, 194, 1),
                        child: const Text(
                          'SIGN IN',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            height: 22.0 /
                                18.0, // Line height = line spacing / font size
                            fontFamily: 'HelveticaNeue',
                            letterSpacing: 0.0,
                            color: Color(0xFF403564),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
