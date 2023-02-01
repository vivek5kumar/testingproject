import 'package:demoweekproj/weekpages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchPage extends StatefulWidget {
  const SwitchPage({super.key});

  @override
  State<SwitchPage> createState() => _SwitchPageState();
}

class _SwitchPageState extends State<SwitchPage> {
  var userNAmeStore = [];
  var userName = [
    "Vivek Kumar",
    "Akash Shrivatshav",
    "Akhilesh Kumar",
    "Mantosh Yadav",
    "Vaibhav",
    "Palash Singh"
  ];

  switchFun(int index) {
    setState(() {
      if (!userNAmeStore.contains(index)) {
        userNAmeStore.add(index);
      } else {
        userNAmeStore.removeWhere((element) => element == index);
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < userName.length; i++) {
      userNAmeStore.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            InkWell(
              onTap: () {
                Get.to(WeekPage());
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.pages),
              ),
            )
          ],
          title: const Text("SwitchPage"),
        ),
        body: ListView.builder(
            itemCount: userName.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    userNAmeStore.contains(i)
                        ? SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: Card(
                              child: Text(userName[i]),
                            ),
                          )
                        : const Text(""),
                    Column(
                      children: [
                        Switch(
                            value: userNAmeStore.contains(i),
                            onChanged: (val) {
                              switchFun(i);
                            }),
                        userNAmeStore.contains(i)
                            ? const Text("ON")
                            : const Text("OFF")
                      ],
                    )
                  ],
                ),
              );
            }));
  }
}
