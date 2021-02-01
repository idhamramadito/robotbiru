import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Pilih ${widget.pageName}',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
            child: Text(
              'Tujuan Terpopuler',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: ListTile(
              dense: true,
              leading: Image.asset("images/gedung.png", width: 40),
              title: Text(
                'Jakarta, Indonesia',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Semua Bandara',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'JKTC',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: ListTile(
              dense: true,
              leading: Image.asset("images/gedung.png", width: 40),
              title: Text(
                'Surabaya, Indonesia',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Semua Bandara',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'SBYC',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: ListTile(
              dense: true,
              leading: Image.asset("images/gedung.png", width: 40),
              title: Text(
                'Medan, Indonesia',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Semua Bandara',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'MESC',
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
