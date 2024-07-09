// import 'package:flutter/material.dart';
//
// import '../../../modal/contact.dart';
//
// class chat extends StatelessWidget {
//   const chat({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text(
//           contact.name,
//           style: TextStyle(color: Colors.white),
//         ),
//         actions: [
//           Row(
//             children: [
//               Icon(
//                 Icons.video_call,
//                 size: 30,
//                 color: Colors.white,
//               ),
//               SizedBox(
//                 width: 12,
//               ),
//               Icon(
//                 Icons.call,
//                 color: Colors.white,
//               ),
//
//             ],
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               height: 900,
//               width: 500,
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: NetworkImage(
//                           "https://i.pinimg.com/564x/04/76/ca/0476cad2dfdd98bd07d377686225cc2c.jpg"))),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:platform_convertor/view/andrioid/homepage.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/contact_data.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text) {
    _textController.clear();
    ChatMessage message = ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: const InputDecoration.collapsed(
                hintText: "Send a message",
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Contact contact = ModalRoute.of(context)!.settings.arguments as Contact;

    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name),
        actions: [
          IconButton(
            onPressed: () async {
              final Uri url = Uri.parse('tel:${contact.contact}');
              await launchUrl(url);
            },
            icon: Icon(Icons.call),
          ),
          PopupMenuButton(itemBuilder: (context) {
            return <PopupMenuEntry>[
              PopupMenuItem(onTap: () {}, child: const Text("View contact")),
              PopupMenuItem(
                  onTap: () {}, child: const Text("Media,Links, and docs")),
              PopupMenuItem(onTap: () {}, child: const Text("Search")),
              PopupMenuItem(
                  onTap: () {}, child: const Text("Mute notifications")),
              PopupMenuItem(
                  onTap: () {}, child: const Text("Disappearing messeage")),
              PopupMenuItem(onTap: () {}, child: const Text("wallpaper")),
              PopupMenuItem(onTap: () {}, child: const Text("More")),
            ];
          })
        ],
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          const Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;

  ChatMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    Contact contact = ModalRoute.of(context)!.settings.arguments as Contact;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0),
            child: const CircleAvatar(
              child: Icon(
                Icons.person,
                size: 25,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${contact.name}(You)"),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Text(text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
