import 'package:flutter/material.dart';
import 'package:homepage/shared/shared_UI_components/big_button.dart';
import 'package:homepage/shared/shared_UI_components/slide_up_marker.dart';
import 'package:homepage/models/order_detail_model.dart';
import 'package:homepage/shared/shared_UI_components/input_text_field.dart';
import 'package:homepage/shared/shared_pages/search_page.dart';

Future orderDetailsSheet(BuildContext context, OrderDetailModel dataPemesanan) {
  List _kodeNegara = [
    ['images/indonesia.png', '+62', 'Indonesia', ''],
    ['images/malaysia.png', '+60', 'Malaysia', ''],
    ['images/singapura.png', '+65', 'Singapura', ''],
  ];
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
                child: Column(
                  children: [
                    SlideUpMarker(),
                    SizedBox(height: 10),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Detail Pemesanan",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Kepada siapa detail pemesanan ingin Anda kirimkan?",
                      ),
                    ),
                    SizedBox(height: 20),
                    InputTextField(
                      initialValue: dataPemesanan.name,
                      displayName: "Masukkan Nama",
                      regex: "[a-zA-Z\ ]",
                      onChanged: (value) {
                        mystate(() {
                          dataPemesanan.name = value;
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
                      child:
                          Text("Title", style: TextStyle(color: Colors.grey)),
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
                      value: dataPemesanan.title,
                      items: _titleList.map((element) {
                        return DropdownMenuItem(
                          child: Text(element),
                          value: element,
                        );
                      }).toList(),
                      onChanged: (value) {
                        mystate(() {
                          dataPemesanan.title = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Flexible(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Kode Negara",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  title: Text(
                                      '${dataPemesanan.countryCode ?? ''}'),
                                  trailing: Icon(Icons.keyboard_arrow_down),
                                  onTap: () async {
                                    final result =
                                        await Navigator.of(context).pushNamed(
                                      '/search_page',
                                      arguments: SearchPage(
                                        pageName: 'Kode Negara',
                                        dataList: _kodeNegara,
                                      ),
                                    );
                                    mystate(() {
                                      dataPemesanan.countryCode =
                                          result ?? dataPemesanan.countryCode;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Flexible(
                          flex: 7,
                          child: InputTextField(
                            initialValue: dataPemesanan.phoneNumber,
                            displayName: "Masukkan No. Telp",
                            regex: '[0-9]',
                            onChanged: (value) {
                              mystate(() {
                                dataPemesanan.phoneNumber = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    InputTextField(
                      initialValue: dataPemesanan.email,
                      displayName: "Masukkan Email",
                      regex: '33',
                      onChanged: (value) {
                        mystate(() {
                          dataPemesanan.email = value;
                        });
                      },
                    ),
                    SizedBox(height: 5),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "E-ticket akan dikirim ke alamat Email ini.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: BigButton(
                        title: 'Simpan',
                        onPressed: (dataPemesanan.name != null &&
                                dataPemesanan.title != null &&
                                dataPemesanan.countryCode != null &&
                                dataPemesanan.phoneNumber != null &&
                                dataPemesanan.email != null)
                            ? () => Navigator.pop(context, dataPemesanan)
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
