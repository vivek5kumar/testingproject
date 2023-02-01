import 'package:demoweekproj/weekController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final favCtrl = Get.put(WeekController());
  var favName = [];
  var userName = [
    "Vivek Kumar",
    "Akash Shrivatshav",
    "Akhilesh Kumar",
    "Mantosh Yadav",
    "Vaibhav",
    "Palash Singh"
  ];

  setFavName(int index) {
    setState(() {
      if (!favName.contains(index)) {
        favName.add(index);
      } else {
        favName.removeWhere((element) => element == index);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < userName.length; i++) {
      favName.add(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: userName.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(userName[i]),
                      favName.contains(i)
                          ? Visibility(
                              visible: favName.contains(i),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setFavName(i);
                                  },
                                  child: const Text("Add")),
                            )
                          : SizedBox(
                              width: MediaQuery.of(context).size.width * 0.17,
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            )
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
