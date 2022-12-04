import 'package:flutter/material.dart';
import 'package:flutter_initializartion/repository/user_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:motion_toast/motion_toast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _globalkey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool boxShadow = true;

  @override
  Widget build(BuildContext context) {
    final loginButton = SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        key: const ValueKey('btnLogin'),
        onPressed: () {
          setState(() {
            boxShadow = false;
          });
          if (_globalkey.currentState!.validate()) {
            _login();
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              // side: const BorderSide(color: Colors.red),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ),
    );

    final emailField = Container(
      decoration: boxShadow == true
          ? const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 25,
                  offset: Offset(0, 4),
                  spreadRadius: -25,
                ),
              ],
            )
          : const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
      child: TextFormField(
        controller: _emailController,
        obscureText: false,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Color(0xff000912),
          ),
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 18),
          hintText: "Email address",
          hintStyle: TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon:
              Icon(Icons.person_outline, size: 30, color: Color(0xffA6B0BD)),
          prefixIconConstraints: BoxConstraints(
            minWidth: 75,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          // errorStyle: TextStyle(wordSpacing: 10),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return '        * required';
          }
          return null;
        },
      ),
    );

    final passwordField = Container(
      decoration: boxShadow == true
          ? const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 25,
                  offset: Offset(0, 4),
                  spreadRadius: -25,
                ),
              ],
            )
          : const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
      child: TextFormField(
        controller: _passwordController,
        obscureText: true,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontWeight: FontWeight.w400,
            color: Color(0xff000912),
          ),
        ),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 18),
          hintText: "Password",
          hintStyle: TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(
            Icons.lock_outline,
            size: 30,
            color: Color(0xffA6B0BD),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 75,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
            borderSide: BorderSide(color: Colors.red),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return '        * required';
          }
          return null;
        },
      ),
    );

    return Scaffold(
      // backgroundColor: Colors.lightGreen,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: _globalkey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  const Center(
                    child: CircleAvatar(
                      radius: 59,
                      backgroundImage: NetworkImage(
                        "https://cdn.vectorstock.com/i/1000x1000/98/01/windmill-event-management-logo-vector-29969801.webp",
                      ),
                    ),
                  ),
                  const SizedBox(height: 70),
                  emailField,
                  const SizedBox(height: 25),
                  passwordField,
                  const SizedBox(height: 17),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(255, 60, 160, 241)),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  loginButton,
                  const SizedBox(height: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: GoogleFonts.poppins(fontSize: 16)),
                      const SizedBox(height: 3),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          "Register here",
                          style: GoogleFonts.poppins(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _navigateToScreen(bool isLogin) {
    if (isLogin) {
      Navigator.pushReplacementNamed(context, '/khalti_payment');
      MotionToast.success(
              description: const Text("        Login successful            ."))
          .show(context);
    } else {
      MotionToast.error(description: const Text("Invalid user credentials"))
          .show(context);
    }
  }

  _login() async {
    try {
      UserRepository userRepository = UserRepository();
      bool isLogin = await userRepository.loginUser(
        _emailController.text,
        _passwordController.text,
      );
      if (isLogin) {
        _navigateToScreen(true);
      } else {
        _navigateToScreen(false);
      }
    } catch (e) {
      MotionToast.error(description: Text("Error: ${e.toString()}"))
          .show(context);
    }
  }
}
