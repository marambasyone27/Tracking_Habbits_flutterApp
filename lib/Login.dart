
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_habits/ForgotPassword.dart';
import 'package:tracking_habits/Register.dart';
import 'package:tracking_habits/profile.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
bool rememberMe = false; // State for checkbox

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.cyan,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              //"assets/images/cute.jpg", // Add this if you want the image
              "assets/images/login.jpg",
              height: 1000,
              width: 1000,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Welcome Back!👋",
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'RobotoMono',
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(255, 163, 70, 240),
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Sign in to access your personalized habit tracking experience",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'RobotoMono',
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(255, 163, 70, 240),
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Email Field
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email",
                           style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'RobotoMono',
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(255, 163, 70, 240),
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Email',
                          labelText: "Email",
                          prefixIcon: const Icon(Icons.email, color: Color.fromARGB(255, 163, 70, 240)),
                          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 17,
                          fontFamily: 'RobotoMono',
                          color: Colors.white,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty || !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Password Field
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password",
                           style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'RobotoMono',
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(255, 163, 70, 240),
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter A strong Password',
                          prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 163, 70, 240)),
                           suffixIcon: const Icon(Icons.visibility_off, color: Color.fromARGB(255, 163, 70, 240)),
                          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 17,
                          fontFamily: 'RobotoMono',
                          color: Colors.white,
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      // Remember Me & Forgot Password Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    rememberMe = newValue ?? false;
                                  });
                                },
                              ),
                              const Text(
                                "Remember me",
                                style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'RobotoMono',
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(255, 163, 70, 240),
                              offset: Offset(2, 2),
                              blurRadius: 3.0,
                            ),
                          ],
                          fontWeight: FontWeight.bold,
                        ),
                              ),
                            ],
                          ),
                         TextButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
    );
  },
  child: const Text(
    "Forgot Password?",
    style: TextStyle(
      fontSize: 17,
      fontFamily: 'RobotoMono',
      color: Colors.white,
      shadows: [
        Shadow(
          color: Color.fromARGB(255, 163, 70, 240),
          offset: Offset(2, 2),
          blurRadius: 3.0,
        ),
      ],
      fontWeight: FontWeight.bold,
    ),
  ),
),

                        ],
                      ),
                      const SizedBox(height: 20),
                      // Sign In Button
                      MaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final prefs = await SharedPreferences.getInstance();
                            String registeredEmail = prefs.getString('email') ?? '';
                            String registeredPassword = prefs.getString('password') ?? '';

                            if (emailController.text == registeredEmail && passwordController.text == registeredPassword) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) =>  ProfilePage(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("You don't have an account. Create an account"),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                              Future.delayed(const Duration(seconds: 2), () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Register()),
                                );
                              });
                            }
                          }
                        },
                        color: const Color.fromARGB(255, 163, 70, 240),
                        textColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'RobotoMono',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
