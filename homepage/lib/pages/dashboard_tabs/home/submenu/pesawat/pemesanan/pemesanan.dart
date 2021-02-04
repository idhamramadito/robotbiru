import 'package:flutter/material.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/pemesanan/UI%20Component/text_field.dart';
import 'package:homepage/pages/dashboard_tabs/home/submenu/pesawat/ticket_details.dart';
import 'dart:math' as math;

class Pemesanan extends StatefulWidget {
  final List<List> data;

  Pemesanan({
    Key key,
    List<List> data,
  })  : this.data = data,
        super(key: key);

  @override
  _PemesananState createState() => _PemesananState();
}

class _PemesananState extends State<Pemesanan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Form Pemesanan'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 15),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Detail Penerbangan',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15.0))),
                  child: Row(
                    children: [
                      Text(
                        'Jakarta',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        size: 40,
                      ),
                      Text(
                        'Denpasar - Bali',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  ticketDetails(
                      context, widget.data[0], widget.data[1], 'Pemesanan');
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(15.0))),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${widget.data[1][2]} - ${widget.data[1][6]}',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '20 Januari 2021 ',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Icon(
                                  Icons.circle,
                                  size: 5,
                                ),
                                Text(
                                  ' 1 Dewasa ',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Icon(
                                  Icons.circle,
                                  size: 5,
                                ),
                                Text(
                                  ' Ekonomi',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              size: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                thickness: 10,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Detail Pemesanan',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Masukkan detail pemesanan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        icon: new Icon(Icons.create),
                        highlightColor: Colors.blue,
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              builder: (context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter mystate) {
                                  return DraggableScrollableSheet(
                                    expand: false,
                                    builder: (context, controller) {
                                      return SingleChildScrollView(
                                        controller: controller,
                                        child: Column(children: [
                                          Center(
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 10),
                                              height: 4,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                color: Color(0xffC4C4C4),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Detail Pemesanan",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Kepada siapa detail pemesanan ingin Anda kirimkan?",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 25),
                                            child: InputTextField(
                                                displayName: "Masukkan Nama",
                                                regex: "[a-zA-Z]"),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
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
                                            padding: const EdgeInsets.fromLTRB(
                                                25, 10, 0, 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text("Title"),
                                              ],
                                            ),
                                          ),
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 25),
                                              child: TextFormField(
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                  suffixIcon: IconButton(
                                                    icon: Transform.rotate(
                                                      angle: 90 * math.pi / 180,
                                                      child: new Icon(Icons
                                                          .arrow_forward_ios_outlined),
                                                    ),
                                                    highlightColor:
                                                        Colors.black,
                                                    onPressed: () {
                                                      print("pressed");
                                                    },
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  hintText: "Title",
                                                ),
                                              )),
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 25),
                                              width: 500,
                                              height: 100,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                      flex: 4,
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                5, 5, 10, 5),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .fromLTRB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          10),
                                                                  child: Text(
                                                                      "Kode Negara"),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                                child:
                                                                    TextFormField(
                                                              readOnly: true,
                                                              decoration:
                                                                  InputDecoration(
                                                                suffixIcon:
                                                                    IconButton(
                                                                  icon: Transform
                                                                      .rotate(
                                                                    angle: 90 *
                                                                        math.pi /
                                                                        180,
                                                                    child: new Icon(
                                                                        Icons
                                                                            .arrow_forward_ios_outlined),
                                                                  ),
                                                                  highlightColor:
                                                                      Colors
                                                                          .black,
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        "pressed");
                                                                  },
                                                                ),
                                                                border:
                                                                    OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                ),
                                                                hintText:
                                                                    "(+62)",
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      )),
                                                  Expanded(
                                                      flex: 7,
                                                      child: Container(
                                                          child: InputTextField(
                                                        displayName:
                                                            "Masukkan No. Telp",
                                                        regex: '[0-9]',
                                                      )))
                                                ],
                                              )),
                                          Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 25),
                                              child: InputTextField(
                                                displayName: "Masukkan Email",
                                                regex:
                                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                                              )),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                25, 0, 25, 25),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                    "E-ticket akan dikirim ke alamat Email ini.",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    )),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10, horizontal: 25),
                                            width: double.infinity,
                                            height: 50,
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(10.0),
                                                  ),
                                                  primary: Theme.of(context)
                                                      .primaryColor),
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
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                thickness: 10,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Detail Penumpang',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sama dengan pemesan',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.toggle_off,
                            size: 40,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Penumpang 1: Dewasa',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                          Icon(
                            Icons.create,
                            color: Colors.blue,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Penumpang 2: Anak',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                          Icon(
                            Icons.create,
                            color: Colors.blue,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Penumpang 3: Bayi',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                          Icon(
                            Icons.create,
                            color: Colors.blue,
                            size: 30,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Divider(
                thickness: 10,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Fasilitas Ekstra',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListTile(
                        onTap: () {
                          // Navigator.of(context).pushNamed(routeName)
                        },
                        leading: Image.asset('images/bagasi.png'),
                        title: Text('Bagasi'),
                        subtitle: Text('Tambah kapasistas barang bawaan mu.'),
                        trailing: Text('Pesan'),
                        // children: [
                        //   Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         'Bagasi',
                        //         style: TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 20,
                        //         ),
                        //       ),
                        //       Text(
                        //         'Pesan',
                        //         style: TextStyle(
                        //           color: Colors.blue,
                        //           fontSize: 20,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        //   Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Text(
                        //       'Tambah kapasitas barang bawaanmu',
                        //       style: TextStyle(
                        //         fontSize: 16,
                        //       ),
                        //     ),
                        //   ),
                        // ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kursi',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                'Pesan',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Pilih tempat duduk di pesawat',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
