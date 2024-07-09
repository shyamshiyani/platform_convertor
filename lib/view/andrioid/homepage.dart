import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import '../../provider/bottom_provider.dart';
import '../../provider/image_provider.dart';
import '../../provider/stepper_provider.dart';
import '../../utils/global_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int bottomnavIndex = 0;
    PageController pageController = PageController();
    return Scaffold(
      bottomNavigationBar: Consumer<BottomProvider>(
        builder: (context, bottomProvider, _) {
          return BottomNavigationBar(
            backgroundColor: Colors.grey.shade50,
            unselectedItemColor: Colors.black,
            currentIndex: bottomProvider.bottomIndex,
            onTap: (val) {
              bottomProvider.bottomnavIndex(val);
              pageController.animateToPage(val,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: "Chat",
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(Icons.call),
                  label: "Call",
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Setting",
                  backgroundColor: Colors.transparent),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<StepperProvider>(context, listen: false)
              .namecontroller
              .clear();
          Provider.of<StepperProvider>(context, listen: false)
              .emailcontroller
              .clear();
          Provider.of<StepperProvider>(context, listen: false)
              .contactcontroller
              .clear();
          Provider.of<StepperProvider>(context, listen: false).step = 0;
          Provider.of<imageprovider>(context, listen: false).pickimagepath =
              null;

          showDialog(
              context: context,
              builder: (context) {
                return const contactdetail();
              });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Consumer<BottomProvider>(
        builder: (context, bottomProvider, _) {
          return PageView(
            controller: pageController,
            onPageChanged: (val) {
              bottomProvider.bottomnavIndex(val);
            },
            children: [
              ...allcomponenet.map((e) {
                return e['widget'];
              }),
            ],
          );
        },
      ),
    );
  }
}

class contactdetail extends StatelessWidget {
  const contactdetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Contact",
          style: GoogleFonts.getFont(
            "Mulish",
            textStyle: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 40),
                alignment: Alignment.center,
                child: Consumer<imageprovider>(
                  builder: (context, imgprovider, _) {
                    return CircleAvatar(
                      backgroundImage: imgprovider.pickimagepath != null
                          ? FileImage(File(imgprovider.pickimagepath!))
                          : null,
                      radius: 60,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Pick Image"),
                                  content: const Text(
                                      "Choose Image from camera or gallery"),
                                  actions: [
                                    Consumer<imageprovider>(
                                      builder: (context, imgprovider, _) {
                                        return FloatingActionButton(
                                          mini: true,
                                          onPressed: () {
                                            Provider.of<imageprovider>(context,
                                                    listen: false)
                                                .pickimage();
                                          },
                                          child: const Icon(Icons.camera_alt),
                                        );
                                      },
                                    ),
                                    Consumer<imageprovider>(
                                      builder: (context, imgprovider, _) {
                                        return FloatingActionButton(
                                          mini: true,
                                          onPressed: () {
                                            Provider.of<imageprovider>(context,
                                                    listen: false)
                                                .pickimagegallary();
                                          },
                                          child: const Icon(Icons.image),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        child: (imgprovider.pickimagepath != null)
                            ? Container()
                            : const Icon(
                                Icons.image,
                                size: 35,
                              ),
                      ),
                    );
                  },
                )),
            const SizedBox(
              height: 40,
            ),
            Consumer<StepperProvider>(
              builder: (context, stepprovider, _) {
                return Stepper(
                  currentStep: stepprovider.step,
                  controlsBuilder: (context, _) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                stepprovider.forwardstep(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                              ),
                              child: Text(
                                stepprovider.step == 2 ? "Save" : "Next",
                              )),
                          if (stepprovider.step != 0)
                            OutlinedButton(
                                onPressed: () {
                                  stepprovider.backwardstep();
                                },
                                style: OutlinedButton.styleFrom(),
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                ))
                        ],
                      ),
                    );
                  },
                  steps: [
                    Step(
                        title: Text(
                          "Name",
                          style: GoogleFonts.getFont("Mulish",
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                        ),
                        content: TextField(
                          controller: stepprovider.namecontroller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        )),
                    Step(
                        title: Text(
                          "Contact",
                          style: GoogleFonts.getFont("Mulish",
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                        ),
                        content: TextField(
                          controller: stepprovider.contactcontroller,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        )),
                    Step(
                      title: Text(
                        "Email",
                        style: GoogleFonts.getFont("Mulish",
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                      ),
                      content: TextField(
                        controller: stepprovider.emailcontroller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "name",
                          counterStyle: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
