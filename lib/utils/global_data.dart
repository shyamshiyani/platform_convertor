import '../view/andrioid/componant/call_part.dart';
import '../view/andrioid/componant/chat_part.dart';
import '../view/andrioid/componant/settings_part.dart';

List<Map<String, dynamic>> allcomponenet = [
  {
    'labal': "chats",
    'widget': chatpage(),
  },
  {
    'labal': "calls",
    'widget': callpage(),
  },
  {
    'labal': "setting",
    'widget': settingpage(),
  }
];
