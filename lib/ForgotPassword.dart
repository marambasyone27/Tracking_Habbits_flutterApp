import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Forgot Password",
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoMono',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 163, 70, 240),
        centerTitle: true, // Center the title for a cleaner look
      ),
      body: Stack(
        children: [
          // خلفية الصورة
          Container(
            width: 3000,
            height: 3000,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cute.jpg"),
                 fit: BoxFit.cover,
              ),
            ),
          ),
          // محتوى النصوص والحقول
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 90),
                const Text(
                  "Enter your email to reset your password",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'RobotoMono',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Color.fromARGB(255, 163, 70, 240),
                        offset: Offset(2, 2),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      fontSize: 15,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 163, 70, 240),
                          offset: Offset(2, 2),
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    prefixIcon: const Icon(Icons.email, color: Color.fromARGB(255, 163, 70, 240)),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.7),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 163, 70, 240),
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                            .hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    final email = emailController.text;
                    if (email.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("A password reset link has been sent to $email"),
                        ),
                      );
                      // يمكنك إضافة منطق إرسال البريد هنا
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter a valid email address"),
                        ),
                      );
                    }
                  },
                  color: const Color.fromARGB(255, 163, 70, 240),
                  textColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20), // تقليل الـ padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Send Reset Link",
                      style: TextStyle(
                        fontSize: 16, // تصغير حجم النص
                        fontFamily: 'RobotoMono',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
