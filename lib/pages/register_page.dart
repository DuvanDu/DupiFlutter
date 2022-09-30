// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    super.key,
    required this.showLoginPage,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final _emailController = TextEditingController();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  Future signUp() async {
    if (passwordConfirmed()) {
      // create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // add user details
      addUserDetails(
        _idController.text.trim(),
      );
    }
  }

  Future addUserDetails(String id) async {
    await FirebaseFirestore.instance.collection('users').add({
      'id': id,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _idController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
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
                  height: 230,
                ),
                //Logo
                Icon(
                  Icons.add_photo_alternate,
                  size: 55,
                ),
                SizedBox(height: 10),

                // Hola Usuario
                Text(
                  'Cree su perfil',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 38,
                  ),
                ),
                SizedBox(height: 25),

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

                SizedBox(height: 20),

                // id text
                Padding(
                  padding: const EdgeInsets.only(right: 95),
                  child: Text(
                    'Introduzca su cedula',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),

                // id textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: TextField(
                    controller: _idController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: Color.fromRGBO(132, 169, 140, 1)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.orange)),
                      hintText: '1020121222',
                      hintStyle: TextStyle(
                        fontFamily: 'PrimeformPro',
                        color: Colors.white,
                      ),
                      fillColor: Color.fromRGBO(132, 169, 140, 1),
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // password text
                Padding(
                  padding: const EdgeInsets.only(right: 120),
                  child: Text(
                    'Cree su contraseña',
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
                      hintText: '6 digitos',
                      hintStyle: TextStyle(
                        fontFamily: 'PrimeformPro',
                        color: Colors.white,
                      ),
                      fillColor: Color.fromRGBO(132, 169, 140, 1),
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // confirm password text
                Padding(
                  padding: const EdgeInsets.only(right: 90),
                  child: Text(
                    'Confirmar contraseña',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),

                // confirm password textfield
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: TextField(
                    controller: _confirmpasswordController,
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
                      hintText: '6 digitos',
                      hintStyle: TextStyle(
                        fontFamily: 'PrimeformPro',
                        color: Colors.white,
                      ),
                      fillColor: Color.fromRGBO(132, 169, 140, 1),
                      filled: true,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55.0),
                  child: GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(214, 121, 7, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Crear cuenta',
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
                    Text('¿Ya tienes una cuenta?'),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        ' Ingresa',
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
