import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:platform_convertor/provider/switch_onoff.dart';
import 'package:provider/provider.dart';

import '../../../provider/contact_Provider.dart';
import '../../../provider/image_provider.dart';

class chatpage extends StatefulWidget {
  const chatpage({super.key});

  @override
  State<chatpage> createState() => _chatpageState();
}

class _chatpageState extends State<chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Chat App",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: PopupMenuButton(
              itemBuilder: (context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    onTap: () {
                      Provider.of<SwitchProvider>(context, listen: false)
                          .onTapTrue();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          action: SnackBarAction(
                            label: "",
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            // textColor: primaryWhite,
                          ),
                          backgroundColor: Colors.green.shade500,
                          content: const Text(
                            "platform Changed SuccessFully!!!",
                          ),
                        ),
                      );
                    },
                    child: const Text("Android"),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      Provider.of<SwitchProvider>(context, listen: false)
                          .onTapFalse();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          action: SnackBarAction(
                            label: "",
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          backgroundColor: Colors.green.shade500,
                          content: const Text(
                            "platform Changed SuccessFully!!!",
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      "IOS",
                    ),
                  ),
                ];
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.058,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade500,
                      borderRadius: BorderRadius.circular(40)),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Search Contact",
                          style: GoogleFonts.getFont("Mulish",
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Consumer<ContactProvider>(
            builder: (context, contactprovider, _) {
              return Column(
                children: [
                  ...contactprovider.allcontact.map(
                    (e) {
                      return Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 8, right: 8),
                        height: 80,
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed("chat", arguments: e);
                          },
                          child: Card(
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                Consumer<imageprovider>(
                                  builder: (context, imgprovider, _) {
                                    return Row(
                                      children: [
                                        SizedBox(
                                          height: 63,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              radius: 28,
                                              backgroundImage: imgprovider
                                                          .pickimagepath !=
                                                      null
                                                  ? FileImage(File(imgprovider
                                                      .pickimagepath!))
                                                  : null,
                                              child:
                                                  (imgprovider.pickimagepath !=
                                                          null)
                                                      ? Container()
                                                      : const Icon(
                                                          Icons.person,
                                                          size: 35,
                                                        ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(
                                            e.name,
                                            style: GoogleFonts.getFont("Mulish",
                                                textStyle: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
