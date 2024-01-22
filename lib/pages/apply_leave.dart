import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:xenov1/config/routes.dart';
import 'package:xenov1/styles.dart';
import 'package:xenov1/widgets/app_actions.dart';
import 'package:xenov1/widgets/bottom_nav_bar.dart';

class ApplyLeave extends StatefulWidget {
  const ApplyLeave({super.key});

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  int _selectedIndex = 1;
  DateTime _selectedFromDate = DateTime.now().toLocal();
  DateTime _selectedToDate = DateTime.now().toLocal();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Handle navigation based on the selected index
      switch (index) {
        case 0:
          // Navigate to Dashboard
          Navigator.pushNamed(context, AppRoutes.dashboard);
          break;
        case 1:
          // Navigate to ApplyLeave
          Navigator.pushNamed(context, AppRoutes.applyleave);
          break;
        case 2:
          // Navigate to Settings
          // You can implement this based on your requirements
          break;
      }
    });
  }

  bool _isDateInRange(DateTime day) {
    // Exclude weekends (Saturday and Sunday)
    if (day.weekday == DateTime.saturday || day.weekday == DateTime.sunday) {
      return false;
    }

    return day.isAfter(_selectedFromDate.subtract(const Duration(days: 0))) &&
        day.isBefore(_selectedToDate.add(const Duration(days: 1)));
  }

  bool _isSwitched = true;
  bool _isSwitched2 = false;

  DateTime _focusedDay = DateTime.now();

  String _selectedLeaveType = 'Annual Leave';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.dashboard);
          },
        ),
        title: const Text(
          'Apply Leave',
          style: apptitile,
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 241, 227),
        actions: AppActions.getAppBarActions(context, true),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedLeaveType,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLeaveType = newValue!;
                      });
                    },
                    borderRadius: BorderRadius.circular(10),
                    items: <String>[
                      'Annual Leave',
                      'Casual Leave',
                      'Short Leave',
                      'Medical Leave',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 15.0),
                padding: const EdgeInsets.only(bottom: 5.0),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(0, 255, 255, 255),
                        Color.fromARGB(0, 204, 204, 204),
                        Color.fromARGB(34, 82, 82, 82),
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: TableCalendar(
                  enabledDayPredicate: (DateTime day) {
                    return day.isAfter(
                        DateTime.now().subtract(const Duration(days: 1)));
                  },
                  calendarFormat: CalendarFormat.month,
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  firstDay: DateTime.now().subtract(const Duration(days: 365)),
                  focusedDay: _focusedDay,
                  lastDay: DateTime.now().add(const Duration(days: 365)),
                  availableGestures: AvailableGestures.all,
                  calendarStyle: const CalendarStyle(
                    isTodayHighlighted: true,
                    todayDecoration: BoxDecoration(
                        color: Color.fromARGB(255, 250, 162, 0),
                        shape: BoxShape.circle),
                    weekendTextStyle: TextStyle(
                      color: Color.fromARGB(40, 0, 0, 0),
                    ),
                    selectedDecoration: ShapeDecoration(
                        shape: CircleBorder(
                          side: BorderSide(
                            width: 0,
                            strokeAlign: 0,
                            color: Colors.transparent,
                          ),
                        ),
                        color: Color.fromARGB(255, 9, 206, 91)),
                  ),
                  selectedDayPredicate: _isDateInRange,
                  pageAnimationCurve: Curves.fastOutSlowIn,
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekendStyle: TextStyle(color: Color.fromARGB(40, 0, 0, 0)),
                  ),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _focusedDay = focusedDay;
                      if (_selectedFromDate.isBefore(_selectedToDate)) {
                        _selectedFromDate = DateTime(
                          selectedDay.year,
                          selectedDay.month,
                          selectedDay.day,
                        );
                        _selectedToDate = _selectedFromDate;
                      } else {
                        _selectedToDate = DateTime(
                          selectedDay.year,
                          selectedDay.month,
                          selectedDay.day,
                        );
                      }
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(10, 66, 66, 66),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Transform.scale(
                                  scale:
                                      0.8, // Adjust the scale factor as needed
                                  child: Switch(
                                    value: _isSwitched,
                                    onChanged: (value) {
                                      setState(() {
                                        _isSwitched = value;
                                      });
                                    },
                                    activeColor:
                                        const Color.fromARGB(255, 1, 132, 255),
                                    inactiveTrackColor:
                                        const Color.fromARGB(255, 10, 10, 10),
                                    inactiveThumbColor: Colors
                                        .transparent, // Set transparent color for the inactive thumb
                                    inactiveThumbImage:
                                        null, // Remove the inactive thumb image
                                    activeThumbImage:
                                        null, // Remove the active thumb image
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                                Icon(
                                  _isSwitched ? Icons.sunny : Icons.mode_night,
                                  color: _isSwitched
                                      ? const Color.fromARGB(255, 1, 132, 255)
                                      : const Color.fromARGB(255, 10, 10, 10),
                                  size: 18.0,
                                ),
                              ],
                            ),
                            Text(
                              DateFormat('yyyy-MM-dd')
                                  .format(_selectedFromDate),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/img/right_arrow.gif'),
                              fit: BoxFit.fill,
                              alignment: Alignment.bottomCenter,
                              repeat: ImageRepeat.noRepeat,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(10, 66, 66, 66),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Transform.scale(
                                  scale:
                                      0.8, // Adjust the scale factor as needed
                                  child: Switch(
                                    value: _isSwitched2,
                                    onChanged: (value) {
                                      setState(() {
                                        _isSwitched2 = value;
                                      });
                                    },
                                    activeColor:
                                        const Color.fromARGB(255, 1, 132, 255),
                                    inactiveTrackColor:
                                        const Color.fromARGB(255, 10, 10, 10),
                                    inactiveThumbColor: Colors
                                        .transparent, // Set transparent color for the inactive thumb
                                    inactiveThumbImage:
                                        null, // Remove the inactive thumb image
                                    activeThumbImage:
                                        null, // Remove the active thumb image
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                                Icon(
                                  _isSwitched2 ? Icons.sunny : Icons.mode_night,
                                  color: _isSwitched2
                                      ? const Color.fromARGB(255, 1, 132, 255)
                                      : const Color.fromARGB(255, 10, 10, 10),
                                  size: 18.0,
                                ),
                              ],
                            ),
                            Text(
                              DateFormat('yyyy-MM-dd').format(_selectedToDate),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Number of Days: ${calculateWeekdays(_selectedFromDate, _selectedToDate)}',
                style: const TextStyle(fontSize: 18),
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

int calculateWeekdays(DateTime startDate, DateTime endDate) {
  int count = 0;
  DateTime currentDate = startDate;

  while (
      currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
    // Exclude weekends (Saturday and Sunday)
    if (currentDate.weekday != DateTime.saturday &&
        currentDate.weekday != DateTime.sunday) {
      count++;
    }
    currentDate = currentDate.add(const Duration(days: 1));
  }

  return count;
}
