import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xenov1/styles.dart';

enum LeaveStatus { pending, canceled, rejected, approved }

class Leave {
  final String type;
  final String reason;
  final DateTime fromDate;
  final DateTime toDate;
  final int numberOfDays;
  LeaveStatus status;
  final String leavedef;

  Leave({
    required this.type,
    required this.reason,
    required this.fromDate,
    required this.toDate,
    required this.numberOfDays,
    required this.status,
    required this.leavedef,
  });
}

class LeaveHistoryList extends StatelessWidget {
  LeaveHistoryList({super.key});

  // Mock data for leave history
  final List<Leave> leaveHistory = [
    Leave(
      type: 'Annual Leave',
      reason: 'Family trip',
      fromDate: DateTime(2024, 1, 10),
      toDate: DateTime(2024, 1, 15),
      numberOfDays: 6,
      status: LeaveStatus.pending,
      leavedef: 'Morning',
    ),
    Leave(
      type: 'Casual Leave',
      reason: 'Fever',
      fromDate: DateTime(2024, 2, 5),
      toDate: DateTime(2024, 2, 7),
      numberOfDays: 3,
      status: LeaveStatus.canceled,
      leavedef: 'Morning',
    ),
    Leave(
      type: 'Short Leave',
      reason: 'Fever',
      fromDate: DateTime(2024, 2, 5),
      toDate: DateTime(2024, 2, 7),
      numberOfDays: 3,
      status: LeaveStatus.rejected,
      leavedef: 'Evening',
    ),
    Leave(
      type: 'Annual Leave',
      reason: 'Family trip',
      fromDate: DateTime(2024, 1, 10),
      toDate: DateTime(2024, 1, 15),
      numberOfDays: 6,
      status: LeaveStatus.pending,
      leavedef: 'Morning',
    ),
    Leave(
      type: 'Casual Leave',
      reason: 'Fever',
      fromDate: DateTime(2024, 2, 5),
      toDate: DateTime(2024, 2, 7),
      numberOfDays: 3,
      status: LeaveStatus.approved,
      leavedef: 'Morning',
    ),
    Leave(
      type: 'Short Leave',
      reason: 'Fever',
      fromDate: DateTime(2024, 2, 5),
      toDate: DateTime(2024, 2, 7),
      numberOfDays: 3,
      status: LeaveStatus.rejected,
      leavedef: 'Morning',
    ),
    Leave(
      type: 'Annual Leave',
      reason: 'Family trip',
      fromDate: DateTime(2024, 1, 10),
      toDate: DateTime(2024, 1, 15),
      numberOfDays: 6,
      status: LeaveStatus.pending,
      leavedef: 'Morning',
    ),
    Leave(
      type: 'Casual Leave',
      reason: 'Fever',
      fromDate: DateTime(2024, 2, 5),
      toDate: DateTime(2024, 2, 7),
      numberOfDays: 3,
      status: LeaveStatus.approved,
      leavedef: 'Morning',
    ),
    Leave(
      type: 'Short Leave',
      reason: 'Fever',
      fromDate: DateTime(2024, 2, 5),
      toDate: DateTime(2024, 2, 7),
      numberOfDays: 3,
      status: LeaveStatus.rejected,
      leavedef: 'Evening',
    ),
    // Add more mock data as needed
  ];

  Color getLeaveStatusColor(LeaveStatus status) {
    switch (status) {
      case LeaveStatus.pending:
        return Colors.amber;
      case LeaveStatus.canceled:
      case LeaveStatus.rejected:
        return Colors.red;
      case LeaveStatus.approved:
        return Colors.green;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Implement your leave history list UI here
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: leaveHistory.length,
        itemBuilder: (context, index) {
          final leave = leaveHistory[index];
          final fromDateFormatted = DateFormat.yMd().format(leave.fromDate);
          final toDateFormatted = DateFormat.yMd().format(leave.toDate);

          if (leave.status == LeaveStatus.canceled ||
              leave.status == LeaveStatus.rejected) {
            // Don't allow swiping for canceled and rejected leaves
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(
                  color: Color.fromARGB(255, 230, 230, 230),
                  width: 1.0,
                ),
              ),
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      child: Container(
                        width: 20,
                        height: 60,
                        decoration: BoxDecoration(
                          color: getLeaveStatusColor(leave.status),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Icon(
                          leave.status == LeaveStatus.pending
                              ? Icons.hourglass_empty
                              : (leave.status == LeaveStatus.canceled ||
                                      leave.status == LeaveStatus.rejected
                                  ? Icons.clear
                                  : Icons.check),
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(
                              leave.type,
                              style: titile2,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '(${leave.leavedef})',
                              style: titile4,
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Reason: ${leave.reason}'),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 3.0,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'From: $fromDateFormatted ',
                                    style: cardtext,
                                  ),
                                  Text(
                                    '| To: $toDateFormatted',
                                    style: cardtext,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Number Of Days: ${leave.numberOfDays}',
                              style: cardtext2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            background: Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              alignment: AlignmentDirectional.centerEnd,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromARGB(255, 255, 17, 0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            onDismissed: (direction) {
              // Handle the deletion logic here
              // For example, you can remove the item from the list
              // leaveHistory.removeAt(index);
            },
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(
                  color: Color.fromARGB(255, 230, 230, 230),
                  width: 1.0,
                ),
              ),
              color: Colors.white,
              child: Container(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      child: Container(
                        width: 20,
                        height: 60,
                        decoration: BoxDecoration(
                          color: getLeaveStatusColor(leave.status),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Icon(
                          leave.status == LeaveStatus.pending
                              ? Icons.hourglass_empty
                              : (leave.status == LeaveStatus.canceled ||
                                      leave.status == LeaveStatus.rejected
                                  ? Icons.clear
                                  : Icons.check),
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(
                              leave.type,
                              style: titile2,
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '(${leave.leavedef})',
                              style: titile4,
                            ),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Reason: ${leave.reason}'),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 3.0,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'From: $fromDateFormatted ',
                                    style: cardtext,
                                  ),
                                  Text(
                                    '| To: $toDateFormatted',
                                    style: cardtext,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Number Of Days: ${leave.numberOfDays}',
                              style: cardtext2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
