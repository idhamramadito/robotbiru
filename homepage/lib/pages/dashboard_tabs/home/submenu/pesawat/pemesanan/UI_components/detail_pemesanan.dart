import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/pemesanan/UI_components/text_field.dart';

Future detailPemesanan(BuildContext context) {
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
          return DraggableScrollableSheet(
            expand: false,
            builder: (context, controller) {
              return SingleChildScrollView(
                controller: controller,
                child: Column(children: [
                  Center(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      height: 4,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Color(0xffC4C4C4),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Detail Pemesanan",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Kepada siapa detail pemesanan ingin Anda kirimkan?",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: InputTextField(
                        displayName: "Masukkan Nama", regex: "[a-zA-Z]"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            "Isi sesuai KTP/Paspor/SIM (tanpa tanda baca & gelar)",
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Title"),
                      ],
                    ),
                  ),
                  Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(Icons.keyboard_arrow_down),
                            highlightColor: Colors.black,
                            onPressed: () {
                              print("pressed");
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Title",
                        ),
                      )),
                  Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      width: 500,
                      height: 100,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 4,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 0, 10),
                                          child: Text("Kode Negara"),
                                        ),
                                      ],
                                    ),
                                    Container(
                                        child: TextFormField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          highlightColor: Colors.black,
                                          onPressed: () {
                                            print("pressed");
                                          },
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        hintText: "(+62)",
                                      ),
                                    )),
                                  ],
                                ),
                              )),
                          Expanded(
                              flex: 7,
                              child: Container(
                                  child: InputTextField(
                                displayName: "Masukkan No. Telp",
                                regex: '[0-9]',
                              )))
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                      child: InputTextField(
                        displayName: "Masukkan Email",
                        regex:
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 0, 25, 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("E-ticket akan dikirim ke alamat Email ini.",
                            style: TextStyle(
                              color: Colors.grey,
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          primary: Theme.of(context).primaryColor),
                      child: Text(
                        "Simpan",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  )
                ]),
              );
            },
          );
        });
      });
}
