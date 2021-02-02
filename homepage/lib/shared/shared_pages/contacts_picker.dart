import 'dart:ui';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsPicker extends StatefulWidget {
  ContactsPicker({Key key}) : super(key: key);

  @override
  _ContactsPickerState createState() => _ContactsPickerState();
}

class _ContactsPickerState extends State<ContactsPicker> {
  List<Contact> contacts = [];
  List<Contact> contactsFiltered = [];
  Map<String, Color> contactsColorMap = new Map();
  TextEditingController searchController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getPermissions();
  }

  getPermissions() async {
    if (await Permission.contacts.request().isGranted) {
      getAllContacts();
      searchController.addListener(() {
        filterContacts();
      });
    }
  }

  String flattenPhoneNumber(String phoneStr) {
    return phoneStr.replaceAllMapped(RegExp(r'^(\+)|\D'), (Match m) {
      return m[0] == "+" ? "+" : "";
    });
  }

  getAllContacts() async {
    List colors = [Colors.green, Colors.indigo, Colors.yellow, Colors.orange];
    int colorIndex = 0;
    List<Contact> _contacts = (await ContactsService.getContacts()).toList();
    _contacts.forEach((contact) {
      Color baseColor = colors[colorIndex];
      contactsColorMap[contact.displayName] = baseColor;
      colorIndex++;
      if (colorIndex == colors.length) {
        colorIndex = 0;
      }
    });
    setState(() {
      contacts = _contacts;
    });
  }

  filterContacts() {
    List<Contact> _contacts = [];
    _contacts.addAll(contacts);
    if (searchController.text.isNotEmpty) {
      _contacts.retainWhere((contact) {
        String searchTerm = searchController.text.toLowerCase();
        String searchTermFlatten = flattenPhoneNumber(searchTerm);
        String contactName = contact.displayName.toLowerCase();
        bool nameMatches = contactName.contains(searchTerm);
        if (nameMatches == true) {
          return true;
        }

        if (searchTermFlatten.isEmpty) {
          return false;
        }

        var phone = contact.phones.firstWhere((phn) {
          String phnFlattened = flattenPhoneNumber(phn.value);
          return phnFlattened.contains(searchTermFlatten);
        }, orElse: () => null);

        return phone != null;
      });
    }
    setState(() {
      contactsFiltered = _contacts;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSearching = searchController.text.isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Pilih Kontak'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'Cari Kontak',
                  prefixIcon: Icon(Icons.search, size: 25),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: isSearching == true
                  ? contactsFiltered.length
                  : contacts.length,
              itemBuilder: (context, index) {
                Contact contact = isSearching == true
                    ? contactsFiltered[index]
                    : contacts[index];

                var baseColor =
                    contactsColorMap[contact.displayName] as dynamic;

                Color color1 = baseColor[800];
                Color color2 = baseColor[400];
                return Column(
                  children: [
                    Visibility(
                      visible: index == 0 ||
                          contact.initials()[0] !=
                              (isSearching == true
                                  ? contactsFiltered[index - 1].initials()[0]
                                  : contacts[index - 1].initials()[0]),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        color: Colors.grey[200],
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        child: Text(
                          contact.initials()[0],
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    ListTile(
                      onTap: () => Navigator.pop(
                        context,
                        contact.phones.elementAt(0).value,
                      ),
                      title: Text(contact.displayName),
                      subtitle: Text(contact.phones.length > 0
                          ? contact.phones.elementAt(0).value
                          : ''),
                      leading:
                          (contact.avatar != null && contact.avatar.length > 0)
                              ? CircleAvatar(
                                  backgroundImage: MemoryImage(contact.avatar),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                        colors: [
                                          color1,
                                          color2,
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight),
                                  ),
                                  child: CircleAvatar(
                                      child: Text(
                                        contact.initials(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.transparent),
                                ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
