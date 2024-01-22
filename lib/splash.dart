import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xenov1/pages/login.dart';
import 'package:xenov1/styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double txtanimation1 = 0.0;
  double txtanimation2 = 0.0;
  double txtanimation3 = 0.0;

  late AnimationController _imageOpacityController;

  @override
  void initState() {
    super.initState();

    _imageOpacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _imageOpacityController.forward();

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

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => const Login(),
          transitionsBuilder: (context, animation1, animation2, child) {
            const begin = 0.0;
            const end = 1.0;
            var opacityTween = Tween<double>(begin: begin, end: end);
            var opacityAnimation = opacityTween.animate(animation1);

            return FadeTransition(
              opacity: opacityAnimation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
        ),
      );
    });
  }

  @override
  void dispose() {
    _imageOpacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 241, 227),
              Color.fromARGB(0, 216, 216, 216),
              Color.fromARGB(0, 216, 216, 216),
            ],
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 1.0,
                child: AnimatedBuilder(
                  animation: _imageOpacityController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _imageOpacityController.value,
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img/splash_bg.png'),
                            fit: BoxFit.fitWidth,
                            alignment: Alignment.bottomCenter,
                            repeat: ImageRepeat.noRepeat,
                          ),
                          color: Color.fromARGB(255, 255, 241, 227),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color.fromARGB(255, 255, 241, 227),
                              Color.fromARGB(255, 255, 241, 227),
                              Color.fromARGB(0, 216, 216, 216),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: FractionallySizedBox(
                heightFactor: 1.0,
                widthFactor: 1.0,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AnimatedOpacity(
                                  opacity: txtanimation1,
                                  duration: const Duration(milliseconds: 900),
                                  child: Text(
                                    'X',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.blackOpsOne(
                                      fontSize: 50,
                                      color:
                                          const Color.fromARGB(255, 3, 78, 128),
                                      height: 1,
                                    ),
                                  ),
                                ),
                                AnimatedOpacity(
                                  opacity: txtanimation1,
                                  duration: const Duration(milliseconds: 900),
                                  child: Text(
                                    'ENO',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.blackOpsOne(
                                      fontSize: 50,
                                      color: const Color.fromARGB(
                                          255, 250, 162, 0),
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            AnimatedOpacity(
                              opacity: txtanimation2,
                              duration: const Duration(seconds: 1),
                              child: const Text(
                                'HR made easy.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromARGB(255, 3, 78, 128),
                                  height: 0.8,
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
                            'Elevate HR with Effortless\nLeave Management.',
                            textAlign: TextAlign.center,
                            style: commonTextStyle1,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        AnimatedOpacity(
                          opacity: txtanimation2,
                          duration: const Duration(seconds: 3),
                          child: const Text(
                            'A seamless, efficient, and empowering HR\nsolution. Transform your HR experience and\noptimize workflows effortlessly.',
                            textAlign: TextAlign.center,
                            style: commonTextStyle2,
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'MyLeave',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              ' by Genesiis',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black54,
                              ),
                            ),
                          ],
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
    );
  }
}
