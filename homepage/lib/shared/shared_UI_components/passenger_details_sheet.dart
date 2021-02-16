import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/birthdate_sheet.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';
import 'package:homepage/shared/shared_UI_components/input_text_field.dart';
import 'package:intl/intl.dart';
import 'package:homepage/models/passenggers_model.dart';

Future passengerDetailsSheet(
    BuildContext context, PassengersModel dataPenumpang) {
  List<String> _titleList = ['Tuan', 'Nyonya', 'Nona'];

  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter mystate) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  SlideUpMarker(),
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Detail Penumpang",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  InputTextField(
                    initialValue: dataPenumpang.name,
                    displayName: "Masukkan Nama",
                    regex: "[a-zA-Z\ ]",
                    onChanged: (value) {
                      mystate(() {
                        dataPenumpang.name = value;
                      });
                    },
                  ),
                  SizedBox(height: 5),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Isi sesuai KTP/Paspor/SIM (tanpa tanda baca & gelar)",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text("Title", style: TextStyle(color: Colors.grey)),
                  ),
                  DropdownButtonFormField(
                    iconEnabledColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    hint: Text('Pilih Title'),
                    value: dataPenumpang.title,
                    items: _titleList.map((element) {
                      return DropdownMenuItem(
                        child: Text(element),
                        value: element,
                      );
                    }).toList(),
                    onChanged: (value) {
                      mystate(() {
                        dataPenumpang.title = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Tanggal Lahir",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text((dataPenumpang.birthDate != null)
                              ? DateFormat("EEEE, d MMMM yyyy", "id_ID")
                                  .format(dataPenumpang.birthDate)
                              : 'Belum Dipilih'),
                          trailing: Icon(Icons.calendar_today),
                          onTap: () async {
                            final DateTime result =
                                await birthdateSheet(context);
                            mystate(() {
                              dataPenumpang.birthDate =
                                  result ?? dataPenumpang.birthDate;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      InputTextField(
                        regex: '[0-9]',
                        initialValue: dataPenumpang.id,
                        keyboardType: TextInputType.number,
                        displayName: "Nomor Identitas (NIK / SIM)",
                        onChanged: (value) {
                          mystate(() {
                            dataPenumpang.id = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: BigButton(
                      title: 'Simpan',
                      onPressed: (dataPenumpang.name != null &&
                              dataPenumpang.title != null &&
                              dataPenumpang.birthDate != null &&
                              (dataPenumpang.ageType != 'Dewasa' ||
                                  dataPenumpang.id != null))
                          ? () => Navigator.pop(context, dataPenumpang)
                          : null,
                    ),
                  ),
                ]),
              ),
            ),
          );
        });
      });
}
