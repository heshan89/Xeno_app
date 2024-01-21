import 'package:flutter/material.dart';
import 'package:xenov1/styles.dart';
import 'package:xenov1/widgets/app_actions.dart';
import 'package:xenov1/widgets/bottom_nav_bar.dart';
import 'package:xenov1/widgets/dashborad_top_block.dart';
import 'package:xenov1/widgets/leave_history.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: apptitile,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 241, 227),
        actions: AppActions.getAppBarActions(context, true),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          color: const Color.fromARGB(255, 242, 242, 242),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  bottom: 15.0,
                  top: 5.0,
                  left: 15.0,
                  right: 15.0,
                ),
                decoration: const BoxDecoration(
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
                height: 170.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    LeaveBox(
                      leavetype: 'Annual Leave',
                      backgroundColor: Color.fromARGB(80, 55, 66, 250),
                      available: '10.5',
                      ttotal: '14',
                      utotal: '0',
                      ptotal: '3.5',
                    ),
                    LeaveBox(
                      leavetype: 'Casual Leave',
                      backgroundColor: Color.fromARGB(80, 39, 174, 96),
                      available: '4',
                      ttotal: '7',
                      utotal: '0',
                      ptotal: '3',
                    ),
                    LeaveBox(
                      leavetype: 'Short Leave',
                      backgroundColor: Color.fromARGB(80, 211, 84, 0),
                      available: '1',
                      ttotal: '2',
                      utotal: '0',
                      ptotal: '1',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 10.0,
                ),
                child: Row(
                  children: [
                    const Text(
                      'Leave History',
                      style: titile5,
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 2, 158, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        elevation: 0,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_box,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Apply Leave',
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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 0.0,
                    left: 10.0,
                    bottom: 20.0,
                    right: 10.0,
                  ),
                  child: LeaveHistoryList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
