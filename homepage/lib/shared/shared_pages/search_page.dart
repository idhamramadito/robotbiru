import 'package:flutter/material.dart';

List _bandara = [
  ['images/gedung.png', 'Jakarta, Indonesia', 'Semua Bandara', 'JKTC'],
  ['images/gedung.png', 'Surabaya, Indonesia', 'Semua Bandara', 'SBYC'],
  ['images/gedung.png', 'Medan, Indonesia', 'Semua Bandara', 'MESC'],
];

List _maskapai = [
  ['images/pesawat_kecil.png', 'American Airlines', '', ''],
  ['images/pesawat_kecil.png', 'AirAsia Malaysia', '', ''],
  ['images/pesawat_kecil.png', 'Garuda Indonesia', '', ''],
];

List _kodeNegara = [
  ['images/indonesia.png', '+62', 'Indonesia', ''],
  ['images/malaysia.png', '+60', 'Malaysia', ''],
  ['images/singapura.png', '+65', 'Singapura', ''],
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
    List _sementara;
    switch (widget.pageName) {
      case 'Maskapai':
        _sementara = List.from(_maskapai);
        break;
      case 'Bandara Asal':
      case 'Bandara Destinasi':
        _sementara = List.from(_bandara);
        break;
      case 'Kode Negara':
        _sementara = List.from(_kodeNegara);
        break;
      default:
    }
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
                    hintText: 'Cari ${widget.pageName}',
                  ),
                ),
              ),
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
                        visible: _sementara[index][2] != '',
                        child: Text(
                          _sementara[index][2],
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey),
                        ),
                      ),
                      trailing: Visibility(
                        visible: _sementara[index][3] != '',
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
