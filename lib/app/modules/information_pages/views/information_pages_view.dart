import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:seasalon/app/controllers/auth_controller.dart';
import 'package:seasalon/app/widgets/app_text.dart';

import '../controllers/information_pages_controller.dart';

class InformationPagesView extends GetView<InformationPagesController> {
  final authC = Get.find<AuthController>();
  InformationPagesView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => InformationPagesController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Information Account'),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            Map<String, dynamic> data = snapshot.data!.data()!;

            return Scaffold(
              backgroundColor: Colors.grey[300],
              body: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  children: [
                    Container(
                      constraints: const BoxConstraints(
                        maxHeight: 110.0,
                      ),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blueGrey[800],
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage("${data["Image"]}"),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Hello",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                ),
                                Text(
                                  "${data['Name']}",
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "${data['Email']}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 35.0, left: 20.0, right: 20.0),
                      child: Builder(
                        builder: (context) {
                          List items = [
                            {
                              "label": "Phone Number ${data['Phone']}",
                              "icon": FontAwesomeIcons.phone,
                              "on_tap": () {}
                            },
                            {
                              "label": "Role Account : ${data['Role']}",
                              "icon": FontAwesomeIcons.userSecret,
                              "on_tap": () {}
                            },
                            {
                              "label": "Created At : ${data['CreatedAt']}",
                              "icon": Icons.info,
                              "on_tap": () {}
                            },
                            {
                              "label": "ID Account :  ${data['Id']}",
                              "icon": FontAwesomeIcons.idCard,
                              "on_tap": () {}
                            }
                          ];

                          return InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal: 12.0,
                              ),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              child: ListView.builder(
                                itemCount: items.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  var item = items[index];
                                  return InkWell(
                                    onTap: () {
                                      if (item["on_tap"] != null) {
                                        item["on_tap"]!();
                                      }
                                    },
                                    child: SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: ListTile(
                                          leading: Icon(
                                            item["icon"],
                                            size: 30.0,
                                          ),
                                          title: Text(item["label"]),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        top: 20.0,
                        right: 20.0,
                        bottom: 0.0,
                      ),
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.info,
                                    size: 30.0,
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "Information About Developer",
                                    style: GoogleFonts.roboto(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.userSecret,
                                    size: 20.0,
                                  ),
                                  AppText(
                                    text: "  Reo Rizki Ananda",
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.instagram,
                                    size: 20.0,
                                  ),
                                  AppText(
                                    text: "  @reoananda_",
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    FontAwesomeIcons.linkedinIn,
                                    size: 20.0,
                                  ),
                                  AppText(
                                    text: "  reorizkiananda",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
