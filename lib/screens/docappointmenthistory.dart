// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:outlook/appointmentdetails.dart';
import 'package:outlook/constants.dart';

class DocAppointmentHistory extends StatefulWidget {
  final docid;
  final role;
  const DocAppointmentHistory(
      {Key? key, required this.docid, required this.role})
      : super(key: key);

  @override
  _Washing_MachineState createState() => _Washing_MachineState();
}

class _Washing_MachineState extends State<DocAppointmentHistory> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _appointmentStream = FirebaseFirestore.instance
        .collection('appointments')
        .where('status', isEqualTo: 'Completed')
        .where('docid', isEqualTo: widget.docid)
        .snapshots();
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: Text("Appointments Records"),
      ),
      body: StreamBuilder(
        stream: _appointmentStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.data!.size == 0) {
            return Center(child: Text('No appointments completed yet!'));
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;

              return InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    // height: 120,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: const Offset(0, 5),
                          spreadRadius: 1)
                    ]),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_circle_outline_outlined,
                      ),
                      title: Text(
                          'Doctor: ${data['docname']} (Booked by: ${data['patientName']})'),
                      subtitle:
                          Text('Date: ${data['date']} at ${data['time']}'),
                      trailing: Column(
                        children: [
                          Text('\$ 50'),
                          Text(
                            'Status: ${data['status']}',
                            style: TextStyle(color: Colors.red),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentDetails(
                                documentId: document.id,
                                page: 'upcoming',
                                role: widget.role,
                                userdata: data,
                              )));
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Future getDocData(String docid) async {
    return await FirebaseFirestore.instance
        .collection('doctor')
        .doc(docid)
        .get();
  }

  Future getUserData(String uid) async {
    return await FirebaseFirestore.instance.collection('user').doc(uid).get();
  }
}