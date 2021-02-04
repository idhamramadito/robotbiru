// import 'package:flutter/material.dart';

// class Filterbutton extends StatefulWidget {
//   Filterbutton({Key key}) : super(key: key);

//   @override
//   _FilterbuttonState createState() => _FilterbuttonState();
// }

// class _FilterbuttonState extends State<Filterbutton> {
//   @override
//   Widget build(BuildContext context) {
//     return showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20),
//           ),
//         ),
//         builder: (context){
//           Container(
//               child: DraggableScrollableSheet(
//             expand: false,
//             builder: (context, controller) {
//               return SingleChildScrollView(
//                 controller: controller,
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(25, 35, 25, 0),
//                   child: Column(
//                     //crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
//                         child: Column(children: [
//                           Padding(
//                             padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
//                             child: Container(
//                                 child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text("Urutkan & Filter"),
//                               ],
//                             )),
//                           )
//                         ]),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text("Urutkan"),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               Container(
//                                 width: 342,
//                                 child: ExpansionTile(
//                                   title: Text(
//                                     "Rekomendasi",
//                                   ),
//                                   children: <Widget>[
//                                     ListView.builder(
//                                         shrinkWrap: true,
//                                         itemCount: 2,
//                                         itemBuilder: (context, index) {
//                                           return Padding(
//                                             padding: const EdgeInsets.fromLTRB(
//                                                 0, 0, 0, 10),
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               children: [
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.fromLTRB(
//                                                           0, 0, 0, 10),
//                                                   child: Text("AAAAAA"),
//                                                 ),
//                                               ],
//                                             ),
//                                           );
//                                         })
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                       Divider(),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                         child: Text("Filter Dengan"),
//                       ),
//                       Column(
//                         children: [
//                           Column(
//                             children: [
//                               Text("Durasi Transit"),
//                               Padding(
//                                 padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
//                                 child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       ListView.builder(
//                                           shrinkWrap: true,
//                                           itemCount: 2,
//                                           itemBuilder: (context, index) {
//                                             return Container(
//                                                 child: Row(
//                                               children: [
//                                                 new Text(
//                                                   "AAAAAAAAAAAA",
//                                                   style: TextStyle(
//                                                       color: Colors.black),
//                                                 ),
//                                               ],
//                                             ));
//                                           })
//                                     ]),
//                               ),
//                             ],
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ));
//         });
//   }
// }
