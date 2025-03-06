// import 'package:flutter/material.dart';


// import '../presentation/resources/color_manager.dart';

// class Dialogs {
//   Future<void> showCalenderDialog(BuildContext context) async {
//     DateTime selectDate= DateTime.now();
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return StatefulBuilder(builder: (context, setState) {
//           return AlertDialog(
//             // <-- SEE HERE
//             title: const Text(
//               'Pick the Day',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             content: SingleChildScrollView(
//                 child: TableCalendar(
//                     focusedDay: DateTime.now(),
//                     firstDay: DateTime.utc(2010, 10, 16),
//                     lastDay: DateTime.utc(2099, 10, 16),
//                   onDaySelected: (selectedDay,focusedDay){
//                       selectDate = selectedDay;
//                   },
//                 ),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text(
//                   'Cancel',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               TextButton(
//                 child: Text(
//                   'Confirm',
//                   style: TextStyle(color: ColorManager.primary),
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).pop(selectDate);
//                 },
//               ),
//             ],
//           );
//         });
//       },
//     );
//   }

//   Future<void> showTimeDialog(BuildContext context) async {
//     TimeOfDay selectTime= TimeOfDay.fromDateTime(DateTime.now());
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return StatefulBuilder(builder: (context, setState) {
//           return AlertDialog(
//             // <-- SEE HERE
//             title: const Text(
//               'Pick the Time',
//               style: TextStyle(fontWeight: FontWeight.bold),
//             ),
//             content: SizedBox(
//               height: 800,width: 700,
//               child: TimePickerDialog(
//                 initialTime: selectTime,

//               ),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 child: const Text(
//                   'Cancel',
//                   style: TextStyle(color: Colors.black),
//                 ),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               TextButton(
//                 child: Text(
//                   'Confirm',
//                   style: TextStyle(color: ColorManager.primary),
//                 ),
//                 onPressed: () {
//                   print("Selected Time --> $selectTime");
//                   Navigator.of(context).pop(selectTime);
//                 },
//               ),
//             ],
//           );
//         });
//       },
//     );
//   }


//   Future<void> showConfirmationDialog(BuildContext context,
//       {required String title,
//       required String text,
//       required VoidCallback onYes,
//       required VoidCallback onNo}) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return StatefulBuilder(builder: (context, setState) {
//           return AlertDialog(
//             backgroundColor: Colors.white,
//             // <-- SEE HERE
//             title:  Text(
//               title,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             content:  SingleChildScrollView(
//               child: ListBody(
//                 children: <Widget>[
//                   Text(text),
//                 ],
//               ),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: onNo,
//                 child: const Text(
//                   'Cancel',
//                   style: TextStyle(color: Colors.black),
//                 )
//               ),
//               TextButton(
//                 onPressed: onYes,
//                 child: Text(
//                   'Confirm',
//                   style: TextStyle(color: ColorManager.primary),
//                 )
//               ),
//             ],
//           );
//         });
//       },
//     );
//   }
// }

// class CalenderDialog extends StatefulWidget {
//   const CalenderDialog({super.key});

//   @override
//   State<CalenderDialog> createState() => _CalenderDialogState();
// }

// class _CalenderDialogState extends State<CalenderDialog> {
//   DateTime _selectDate = DateTime.now();
//   DateTime _focusedDate = DateTime.now();
//   @override
//   Widget build(BuildContext context) {

//         return AlertDialog(
//           backgroundColor: Colors.white,
//           title: const Text("Select Date",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
//           content:  SizedBox(
//                 height: MediaQuery.of(context).size.height*0.4,
//                 width: MediaQuery.of(context).size.width,
//                 child: SingleChildScrollView(
//                   child: TableCalendar(
//                     // dayHitTestBehavior: HitTestBehavior.deferToChild,
//                     // shouldFillViewport: true,
//                     focusedDay: _focusedDate,
//                     firstDay: DateTime.utc(2010, 10, 16),
//                     lastDay: DateTime.utc(2099, 10, 16),
//                     calendarStyle: CalendarStyle(
//                       todayDecoration: BoxDecoration(
//                         color: ColorManager.primary.withOpacity(0.2),
//                         shape: BoxShape.circle,
//                       ),
//                       selectedDecoration: BoxDecoration(
//                         color: ColorManager.primary,
//                         shape: BoxShape.circle,
//                       ),
//                     ),
//                     selectedDayPredicate: (currentSelectedDate) {
//                       // as per the documentation 'selectedDayPredicate' needs to determine current selected day.
//                       return (isSameDay(
//                           _selectDate, currentSelectedDate));
//                     },
//                     onDaySelected: (selectedDay,focusedDay){

//                       setState((){
//                         _selectDate = selectedDay;
//                         _focusedDate = selectedDay;
//                       });
//                     },
//                   ),
//                 ),
//               ),


//           actions: <Widget>[
//             TextButton(
//               child: const Text(
//                 'Cancel',
//                 style: TextStyle(color: Colors.black),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text(
//                 'Confirm',
//                 style: TextStyle(color: ColorManager.primary),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop(_selectDate);
//               },
//             ),
//           ],
//         );
//       }

//   }

