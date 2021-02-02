import 'package:flutter/material.dart';

List _tujuan = [
  ['images/gedung.png', 'Jakarta, Indonesia', 'Semua Bandara', 'JKTC'],
  ['images/gedung.png', 'Surabaya, Indonesia', 'Semua Bandara', 'SBYC'],
  ['images/gedung.png', 'Medan, Indonesia', 'Semua Bandara', 'MESC'],
];

List _maskapai = [
  ['images/pesawat_kecil.png', 'American Airlines', '', ''],
  ['images/pesawat_kecil.png', 'AirAsia Malaysia', '', ''],
  ['images/pesawat_kecil.png', 'Garuda Indonesia', '', ''],
];

class SearchPage extends StatefulWidget {
  SearchPage({
    Key key,
    this.pageName,
  }) : super(key: key);

  final String pageName;

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    List _sementara = (widget.pageName == 'Maskapai')
        ? List.from(_maskapai)
        : List.from(_tujuan);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Pilih ${widget.pageName}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, size: 25),
                      hintText: (widget.pageName == 'Maskapai')
                          ? 'Cari Maskapai'
                          : 'Cari Kota atau Bandara'),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.fromLTRB(30, 10, 20, 0),
              child: Text((widget.pageName == 'Maskapai')
                  ? 'Semua Maskapai'
                  : 'Tujuan Terpopuler'),
            ),
            SizedBox(height: 10),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: _sementara.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.pop(context, _sementara[index][1]);
                      },
                      dense: true,
                      leading: Image.asset(_sementara[index][0], width: 40),
                      title: Text(
                        _sementara[index][1],
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Visibility(
                        visible: widget.pageName != 'Maskapai',
                        child: Text(
                          _sementara[index][2],
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                      ),
                      trailing: Visibility(
                        visible: widget.pageName != 'Maskapai',
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            _sementara[index][3],
                            style: TextStyle(
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
