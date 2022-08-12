// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// import '../constants.dart';
// import 'adddoctor.dart';
// import 'main/main_screen.dart';

// class NextAddDoctor extends StatefulWidget {
//   var days;
//   NextAddDoctor({Key? key, required this.days}) : super(key: key);

//   @override
//   State<NextAddDoctor> createState() => _NextAddDoctorState();
// }

// class _NextAddDoctorState extends State<NextAddDoctor> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView.builder(
//       itemCount: widget.days.length,
//       itemBuilder: (context, index) {
//         List<Map> timetable = <Map>[];
//         return Container(
//           margin: EdgeInsets.only(top: 20),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20), color: kPrimaryColor),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text(
//                 widget.days[index],
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//               Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Row(
//                       children: [
//                         ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               elevation: 0,
//                               primary: kBgDarkColor,
//                             ),
//                             onPressed: () {
//                               FromTime().then((_) {
//                                 timetable.add({
//                                   'day': widget.days[index],
//                                   'fromTime': fromTime
//                                 });
//                                 print(timetable);
//                               });
//                             },
//                             child: Text(
//                               'Available from',
//                               style: TextStyle(color: kTextColor),
//                             )),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.1,
//                         ),
//                         Text(
//                           fromTime != null ? fromTime! : '',
//                           style: const TextStyle(
//                               fontSize: 14, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               elevation: 0,
//                               primary: kBgDarkColor,
//                             ),
//                             onPressed: ToTime,
//                             child: Text(
//                               'Available To',
//                               style: TextStyle(color: kTextColor),
//                             )),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.1,
//                         ),
//                         Text(
//                           toTime != null ? toTime! : '',
//                           style: const TextStyle(
//                               fontSize: 14, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                     Divider()
//                   ])
//             ],
//           ),
//         );
//       },
//     ));
//   }

//   String? fromTime;
//   String? toTime;
//   Future<void> FromTime() async {
//     final TimeOfDay? result = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay.now(),
//         builder: (context, child) {
//           return MediaQuery(
//               data: MediaQuery.of(context).copyWith(
//                   // Using 12-Hour format
//                   alwaysUse24HourFormat: false),
//               // If you want 24-Hour format, just change alwaysUse24HourFormat to true
//               child: child!);
//         });
//     if (result != null) {
//       setState(() {
//         fromTime = result.format(context);
//       });
//     }
//   }

//   Future<void> ToTime() async {
//     final TimeOfDay? result = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay.now(),
//         builder: (context, child) {
//           return MediaQuery(
//               data: MediaQuery.of(context).copyWith(
//                   // Using 12-Hour format
//                   alwaysUse24HourFormat: false),
//               // If you want 24-Hour format, just change alwaysUse24HourFormat to true
//               child: child!);
//         });
//     if (result != null) {
//       setState(() {
//         toTime = result.format(context);
//       });
//     }
//   }

//   static String p =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   static RegExp regExp = new RegExp(p);

//   void vaildation(var day) {
//     if (fromTime == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Please Select From-Time"),
//         ),
//       );
//     } else if (fromTime == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Please Select To-Time"),
//         ),
//       );
//     } else {
//       database.RegisterDoc(
//               localmage,
//               name.text,
//               category.text,
//               '${experience.text} Years',
//               contact.text,
//               day,
//               fromTime!,
//               toTime!,
//               selectedLocation,
//               shortinfo.text,
//               desc.text)
//           .then((_) {
//         Navigator.of(context)
//             .push(MaterialPageRoute(
//                 builder: (context) => MainScreen(
//                       role: 'admin',
//                     )))
//             .then((_) {
//           Fluttertoast.showToast(
//               msg: "Registered Successfully",
//               toastLength: Toast.LENGTH_LONG,
//               gravity: ToastGravity.BOTTOM,
//               timeInSecForIosWeb: 3,
//               backgroundColor: kPrimaryColor,
//               textColor: Colors.white,
//               fontSize: 16.0);
//         });
//       });
//     }
//   }
// }
