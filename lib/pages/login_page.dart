// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'forgort_pw_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({
    super.key,
    required this.showRegisterPage,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(202, 210, 197, 1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/curva.png',
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.fitWidth,
                ),
                //Logo
                Icon(
                  Icons.add_photo_alternate,
                  size: 80,
                ),
                SizedBox(height: 10),

                // Hola Usuario
                Text(
                  'Hola Usuario',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                  ),
                ),
                SizedBox(height: 50),

                // email text
                Padding(
                  padding: const EdgeInsets.only(right: 90),
                  child: Text(
                    'Introduzca su correo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),

                // email textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(132, 169, 140, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.orange)),
                      hintText: 'usuario@ejemplo.com',
                      hintStyle: TextStyle(
                        fontFamily: 'PrimeformPro',
                        color: Colors.white,
                      ),
                      fillColor: Color.fromRGBO(132, 169, 140, 1),
                      filled: true,
                    ),
                  ),
                ),

                //Otra Forma
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 55.0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Color.fromRGBO(132, 169, 140, 1),
                //       border: Border.all(color: Color.fromRGBO(132, 169, 140, 1)),
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.only(left: 8.0),
                //       child: TextField(
                //         decoration: InputDecoration(
                //             border: InputBorder.none,
                //             hintText: 'usuario@ejemplo.com',
                //             hintStyle: TextStyle(
                //               color: Colors.white,
                //             )),
                //       ),
                //     ),
                //   ),
                // ),

                SizedBox(height: 20),

                // password text
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Text(
                    'Introduzca la contraseña',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),

                // password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(132, 169, 140, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.orange)),
                      hintText: '6 Digitos',
                      hintStyle: TextStyle(
                        fontFamily: 'PrimeformPro',
                        color: Colors.white,
                      ),
                      fillColor: Color.fromRGBO(132, 169, 140, 1),
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 3),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ForgotPasswordPage();
                              },
                            ),
                          );
                        },
                        child: Text(
                          '¿Olvidaste tu contraseña?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Otra Forma
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 55.0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Color.fromRGBO(132, 169, 140, 1),
                //       border: Border.all(color: Color.fromRGBO(132, 169, 140, 1)),
                //       borderRadius: BorderRadius.circular(12),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.only(left: 8.0),
                //       child: TextField(
                //         obscureText: true,
                //         decoration: InputDecoration(
                //             border: InputBorder.none,
                //             hintText: '6 digitos',
                //             hintStyle: TextStyle(
                //               color: Colors.white,
                //             )),
                //       ),
                //     ),
                //   ),
                // ),

                SizedBox(height: 10),

                // sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(214, 121, 7, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Ingresar',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                //crear cuenta
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('¿No eres miembro?'),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        ' Crea una Cuenta',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
