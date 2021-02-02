// import 'package:flutter/material.dart';
// import 'package:homepage/models/transportation_attributes.dart';

// Future ubahJadwal(BuildContext context) {
//   bool _isTwoWayTrip = false;
//   return showModalBottomSheet(
//     context: context,
//     isScrollControlled: true,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(20),
//         topRight: Radius.circular(20),
//       ),
//     ),
//     builder: (context) {
//       return DraggableScrollableSheet(
//         expand: false,
//         builder: (context, controller) {
//           return SingleChildScrollView(
//             controller: controller,
//             child: Column(
//               children: [
//                 ListView.separated(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: _dataList.length,
//                   separatorBuilder: (BuildContext context, int index) =>
//                       Divider(thickness: 1),
//                   itemBuilder: (BuildContext context, int index) {
//                     return Visibility(
//                       visible: (_dataList[index].name != 'Tanggal Pulang') ||
//                           (_isTwoWayTrip),
//                       child: InkWell(
//                         onTap: () {
//                           Navigator.of(context).pushNamed(
//                             _dataList[index].routeName,
//                             arguments: _dataList[index].name,
//                           );
//                         },
//                         child: ListTile(
//                           dense: true,
//                           leading: Icon(
//                             _dataList[index].icon,
//                             color: Theme.of(context).primaryColor,
//                           ),
//                           title: Text(
//                             _dataList[index].name ?? 'Kosong',
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                           subtitle: Text(
//                             _dataList[index].content ?? 'Belum Dipilih',
//                             style: TextStyle(
//                               fontSize: 15,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                             ),
//                           ),
//                           trailing: Visibility(
//                             visible: _dataList[index].name == 'Tanggal Pergi',
//                             child: Switch(
//                               value: _isTwoWayTrip,
//                               onChanged: (val) {
//                                 setState(() {
//                                   _isTwoWayTrip = val;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 )
//               ],
//             ),
//           );
//         },
//       );
//     },
//   );
// }

// List<TransportationAttributes> _dataList = [
//   TransportationAttributes(
//     name: 'Asal',
//     icon: Icons.flight_takeoff,
//     routeName: '/search_page',
//   ),
//   TransportationAttributes(
//     name: 'Destinasi',
//     icon: Icons.flight_land,
//     routeName: '/search_page',
//   ),
//   TransportationAttributes(
//     name: 'Tanggal Pergi',
//     icon: Icons.calendar_today,
//     routeName: '/date_page',
//   ),
//   TransportationAttributes(
//     name: 'Tanggal Pulang',
//     icon: Icons.calendar_today,
//     routeName: '/date_page',
//   ),
//   TransportationAttributes(
//     name: 'Jumlah Penumpang',
//     icon: Icons.person,
//     routeName: '/passengers',
//   ),
//   TransportationAttributes(
//     name: 'Kelas Kabin',
//     icon: Icons.airline_seat_recline_extra,
//     routeName: '/cabin_class',
//   ),
//   TransportationAttributes(
//     name: 'Maskapai',
//     icon: Icons.airplanemode_active,
//     routeName: '/search_page',
//   ),
// ];
