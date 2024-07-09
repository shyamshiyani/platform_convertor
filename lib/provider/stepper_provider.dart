import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/contact_data.dart';
import 'contact_Provider.dart';

class StepperProvider extends ChangeNotifier {
  int step = 0;
  TextEditingController namecontroller = TextEditingController();
  TextEditingController contactcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  void forwardstep(BuildContext context) {
    if (step == 2) {
      Contact contact = Contact(
          name: namecontroller.text,
          contact: contactcontroller.text,
          email: emailcontroller.text);
      Provider.of<ContactProvider>(context, listen: false).addcontact(contact);
      Navigator.pop(context);
    }
    if (step < 2) {
      step++;
    }
    notifyListeners();
  }

  void backwardstep() {
    if (step > 0) {
      step--;
    }
    notifyListeners();
  }
}
