import 'package:flutter/material.dart';

import '../model/contact_data.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> allcontact = [];

  void addcontact(Contact contact) {
    allcontact.add(contact);
    notifyListeners();
  }

  void removecontact(Contact contact) {
    allcontact.remove(contact);
    notifyListeners();
  }
}
