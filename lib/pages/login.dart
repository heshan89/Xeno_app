import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xenov1/pages/dashboard.dart';
import 'package:xenov1/styles.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double txtanimation1 = 0.0;
  double txtanimation2 = 0.0;
  double txtanimation3 = 0.0;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String usernameError = '';
  String passwordError = '';

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 900), () {
      setState(() {
        txtanimation1 = 1.0;
      });
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        txtanimation2 = 1.0;
      });
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        txtanimation3 = 1.0;
      });
    });
  }

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: FractionallySizedBox(
                  heightFactor: 1.0,
                  widthFactor: 1.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/login_bg.png'),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.bottomCenter,
                        repeat: ImageRepeat.noRepeat,
                      ),
                      color: Color.fromARGB(255, 255, 255, 255),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255),
                          Color.fromARGB(255, 255, 255, 255),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AnimatedOpacity(
                                        opacity: txtanimation1,
                                        duration:
                                            const Duration(milliseconds: 900),
                                        child: Text(
                                          'X',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.blackOpsOne(
                                            fontSize: 40,
                                            color: const Color.fromARGB(
                                                255, 3, 78, 128),
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                      AnimatedOpacity(
                                        opacity: txtanimation1,
                                        duration:
                                            const Duration(milliseconds: 900),
                                        child: Text(
                                          'ENO',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.blackOpsOne(
                                            fontSize: 40,
                                            color: const Color.fromARGB(
                                                255, 250, 162, 0),
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25.0,
                                  ),
                                  AnimatedOpacity(
                                    opacity: txtanimation2,
                                    duration: const Duration(seconds: 3),
                                    child: const Text(
                                      'Hello there !',
                                      style: commonTextStyle1,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  AnimatedOpacity(
                                    opacity: txtanimation2,
                                    duration: const Duration(seconds: 3),
                                    child: const Text(
                                      'Welcome Back.',
                                      style: commonTextStyle1,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 25.0,
                                  ),
                                  const Text(
                                    "Please enter your details.",
                                    style: commonTextStyle2,
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              labelText: 'Enter your username',
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 20.0,
                              ),
                              fillColor:
                                  const Color.fromARGB(247, 247, 248, 249),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 177, 177, 177),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 218, 218, 218),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 218, 218, 218),
                                ),
                              ),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 131, 145, 161),
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: 'Enter your password',
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 20.0,
                              ),
                              fillColor:
                                  const Color.fromARGB(247, 247, 248, 249),
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 177, 177, 177),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 218, 218, 218),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: Color.fromARGB(255, 218, 218, 218),
                                ),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color:
                                      const Color.fromARGB(255, 131, 145, 161),
                                  size: 20.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                              labelStyle: const TextStyle(
                                color: Color.fromARGB(255, 131, 145, 161),
                                fontSize: 16.0,
                              ),
                            ),
                            obscureText: !isPasswordVisible,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          TextButton(
                            onPressed: () {
                              // Add your "Forgot Password?" logic here
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color.fromARGB(255, 82, 82, 82),
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _performSignIn();
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: const Color(0xFF00426C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              fixedSize: const Size(
                                double.infinity,
                                50.0,
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.login,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Sign In',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _validateUsername(String username) {
    if (username.isEmpty) {
      return 'Username cannot be empty';
    }
    return '';
  }

  String _validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty';
    }
    return '';
  }

  void _performSignIn() {
    // Add your actual authentication logic here
    // For demonstration purposes, let's assume the sign-in is always successful
    bool isSignInSuccessful = true;

    String usernameError = _validateUsername(usernameController.text);
    String passwordError = _validatePassword(passwordController.text);

    if (usernameError.isEmpty && passwordError.isEmpty) {
      if (isSignInSuccessful) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const Dashboard(),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: const Color.fromARGB(255, 255, 17, 0),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (usernameError.isNotEmpty) Text(usernameError),
              if (passwordError.isNotEmpty) Text(passwordError),
            ],
          ),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }
}
