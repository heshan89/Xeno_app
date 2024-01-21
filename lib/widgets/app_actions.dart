import 'package:flutter/material.dart';
import 'package:xenov1/config/routes.dart';

class AppActions {
  static List<Widget> getAppBarActions(
      BuildContext context, bool showNotificationIndicator) {
    return [
      Stack(
        children: [
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Colors.black,
            onPressed: () {
              // Handle notifications action
            },
          ),
          if (showNotificationIndicator) const BlinkingIndicator(),
        ],
      ),
      PopupMenuButton<String>(
        onSelected: (value) {
          if (value == 'profile') {
            // Handle profile action
          } else if (value == 'logout') {
            // Navigate to the login page when Logout is selected
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          }
        },
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem<String>(
              value: 'profile',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'logout',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        icon: const Icon(
          Icons.person,
          color: Colors.black,
        ),
        color: const Color.fromARGB(255, 255, 241, 227),
        elevation: 0,
      ),
    ];
  }
}

class BlinkingIndicator extends StatefulWidget {
  const BlinkingIndicator({super.key});

  @override
  State<BlinkingIndicator> createState() => _BlinkingIndicatorState();
}

class _BlinkingIndicatorState extends State<BlinkingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      top: 5,
      child: FadeTransition(
        opacity: _controller,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 255, 17, 0),
          ),
          child: const Text(
            '•',
            style:
                TextStyle(color: Color.fromARGB(255, 255, 17, 0), fontSize: 10),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
