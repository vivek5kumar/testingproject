import 'dart:async';

import 'package:demoweekproj/favoritepage.dart';
import 'package:demoweekproj/futurePage.dart';
import 'package:demoweekproj/profilepage.dart';
import 'package:demoweekproj/weekController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeekPage extends StatelessWidget {
  WeekPage({super.key});

  final weekCtrl = Get.put(WeekController());

  int _start = 30;
  bool isVisible = false;

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_start <= 0) {
        timer.cancel();
      } else {
        _start = _start - 1;
      }
    });
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // weekCtrl.setCheck();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(weekCtrl.text.value)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        horizontalTitleGap: 10,
                        title: InkWell(
                          onTap: () {
                            // myRestauData.showDataRestra(true, widget.index);
                          },
                          child: const Text(
                            "VivekRestau",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            InkWell(
                              onTap: () {
                                // myRestauData.showDataRestra(true, widget.index);
                              },
                              child: Container(
                                  width: 50,
                                  height: 28,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(const FavoritePage());
                                      },
                                      child: const Text(
                                        "View",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                // deleteDialog(context);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: const Padding(
                                    padding: EdgeInsets.all(6.0),
                                    // child: Icon(
                                    //   FontAwesomeIcons.trashAlt,
                                    //   color: Colors.white,
                                    //   size: 16,
                                    // ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Obx(() => Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                weekCtrl.checkBox(
                                    0,
                                    weekCtrl.storeWeek.contains("EVE")
                                        ? true.obs
                                        : false.obs,
                                    true.obs),
                                weekCtrl.checkBox(
                                  4,
                                  weekCtrl.storeWeek.contains("THU")
                                      ? true.obs
                                      : false.obs,
                                  !weekCtrl.storeWeek.contains("EVE")
                                      ? true.obs
                                      : false.obs,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                weekCtrl.checkBox(
                                  1,
                                  weekCtrl.weekDays.contains("MON")
                                      ? true.obs
                                      : false.obs,
                                  !weekCtrl.storeWeek.contains("EVE")
                                      ? true.obs
                                      : false.obs,
                                ),
                                weekCtrl.checkBox(
                                  5,
                                  weekCtrl.weekDays.contains("FRI")
                                      ? true.obs
                                      : false.obs,
                                  !weekCtrl.storeWeek.contains("EVE")
                                      ? true.obs
                                      : false.obs,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                weekCtrl.checkBox(
                                  2,
                                  weekCtrl.weekDays.contains("TUE")
                                      ? true.obs
                                      : false.obs,
                                  !weekCtrl.storeWeek.contains("EVE")
                                      ? true.obs
                                      : false.obs,
                                ),
                                weekCtrl.checkBox(
                                  6,
                                  weekCtrl.weekDays.contains("FRI")
                                      ? true.obs
                                      : false.obs,
                                  !weekCtrl.storeWeek.contains("EVE")
                                      ? true.obs
                                      : false.obs,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                weekCtrl.checkBox(
                                  3,
                                  weekCtrl.weekDays.contains("SAT")
                                      ? true.obs
                                      : false.obs,
                                  !weekCtrl.storeWeek.contains("EVE")
                                      ? true.obs
                                      : false.obs,
                                ),
                                weekCtrl.checkBox(
                                  7,
                                  weekCtrl.weekDays.contains("SUN")
                                      ? true.obs
                                      : false.obs,
                                  !weekCtrl.storeWeek.contains("EVE")
                                      ? true.obs
                                      : false.obs,
                                )
                              ],
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      !weekCtrl.isFavorited.value
                          ? const Text(
                              "Please like the heart for appriciation",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: const Text("Thank you")),
                      IconButton(
                        icon: (weekCtrl.isFavorited.value
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              )),
                        onPressed: () {
                          weekCtrl.setFevorit();
                        },
                      ),
                    ],
                  )),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Get.to(const ProfilePage());
                      },
                      child: const Text("Next")),
                  TextButton(
                      onPressed: () {
                        Get.to(FuturePage());
                        Get.snackbar("Success", "Successfully loading data");
                      },
                      child: const Text("Future"))
                ],
              ),
              Column(
                children: [
                  Center(
                      child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Visibility(
                        visible: weekCtrl.start > 0,
                        child: ElevatedButton(
                            onPressed: () {
                              weekCtrl.start = 31;
                              startTimer();
                            },
                            child: const Text("Send Otp")),
                      ),
                      TextButton(
                          onPressed: () {
                            startTimer();
                            weekCtrl.start = 31;
                          },
                          child: Text("Resend"))
                    ],
                  )),
                  Visibility(
                    visible: weekCtrl.start > 0,
                    child: Text(
                      "Otp is sending on email :${weekCtrl.start}",
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
