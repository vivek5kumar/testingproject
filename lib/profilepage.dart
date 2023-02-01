import 'dart:async';
import 'dart:io';

import 'package:demoweekproj/profileContoller.dart';
import 'package:demoweekproj/weekController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final profileCtrlr = Get.put(ProfileController());
  final weekCtrl = Get.put(WeekController());
  DateTime dateTime = DateTime.now();

  File? image;
  final ImagePicker _picker = ImagePicker();

  getProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Colors.red[100],
            radius: 55,
            backgroundImage: image != null ? FileImage(image!) : null,
          ),
          Positioned(
              bottom: 16,
              right: 16.0,
              child: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      context: context, builder: (builder) => bottomsheet());
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                ),
              ))
        ],
      ),
    );
  }

  bottomsheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            "choose Profile photo ",
            style: TextStyle(color: Colors.red),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        takePhoto(ImageSource.camera);
                      },
                      icon: const Icon(Icons.camera)),
                  const Text("Camara")
                ],
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        takePhoto(ImageSource.gallery);
                      },
                      icon: const Icon(Icons.image)),
                  const Text("Gallary")
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  takePhoto(ImageSource source) async {
    var pickedImage = await _picker.pickImage(source: source);
    setState(() {
      image = File(pickedImage!.path);
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          profileCtrlr.switchValue == 1 ? " Leave" : "Work From Home",
        )),
        body: GetBuilder<ProfileController>(
            init: Get.put(ProfileController()),
            builder: (profileCtrl) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(DateFormat("hh:MM-ss,a").format(dateTime),
                        textAlign: TextAlign.left),
                    getProfile(),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio(
                              activeColor: Colors.red,
                              value: 1,
                              groupValue: profileCtrl.switchValue,
                              onChanged: (val) {
                                profileCtrl.setCheck(val);
                              }),
                          const Text("Leave"),
                          Radio(
                              activeColor: Colors.red,
                              value: 2,
                              groupValue: profileCtrl.switchValue,
                              onChanged: (val) {
                                profileCtrl.setCheck(val);
                              }),
                          const Text("Work From Home")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: DropdownButtonFormField(
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          value: profileCtrl.switchValue == 1
                              ? profileCtrl.selectLeaveType
                              : profileCtrl.selectWork,
                          items: profileCtrl.switchValue == 1
                              ? profileCtrl.leaveTypes.map((data) {
                                  return DropdownMenuItem(
                                      value: data.toString(),
                                      child: Text(data.toString()));
                                }).toList()
                              : profileCtrl.workTypes.map((data) {
                                  return DropdownMenuItem(
                                      value: data.toString(),
                                      child: Text(data.toString()));
                                }).toList(),
                          onChanged: (val) {
                            profileCtrl.switchValue == 1
                                ? profileCtrl.leaveDrop(val)
                                : profileCtrl.workDrop(val);
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                      value: 1,
                                      groupValue: profileCtrl.groupValue,
                                      onChanged: (val) {
                                        setState(() {
                                          profileCtrl.groupValue = val!;
                                        });
                                      }),
                                  const Text("Half Day")
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                      value: 2,
                                      groupValue: profileCtrl.groupValue,
                                      onChanged: (val) {
                                        setState(() {
                                          profileCtrl.groupValue = val!;
                                        });
                                      }),
                                  const Text("Full Day")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
