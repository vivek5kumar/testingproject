import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeekController extends GetxController {
  var text = "Select".obs;
  RxBool isFavorited = false.obs;
  RxList storeWeek = [].obs;
  int start = 31;

  var weekDays = ["Every Day", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];

  List<RxBool> isChecked = [for (int i = 0; i < 8; i++) RxBool(false)];

  //  for api use only
  // setCheck() {
  //   for (int i = 0; i < storeWeek.length; i++) {
  //     for (int j = 0; j < weekDays.length; j++) {
  //       if (storeWeek[i] == weekDays[j].substring(0, 3).toUpperCase()) {
  //         isChecked[j].value = true;
  //       }
  //     }
  //   }
  // }

  storeDays() {
    storeWeek.clear();
    for (int i = 0; i < isChecked.length; i++) {
      if (isChecked[i] == true) {
        storeWeek.add(weekDays[i].substring(0, 3).toUpperCase());
        text(storeWeek.first.toString());
      }
    }

    getSnack("Success", "Day selected successfully !", null);
    update();
  }

  checkBox(int index, RxBool isSet, RxBool isEnable) {
    return Obx(() => Row(
          children: [
            Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: isChecked[index].value,
                onChanged: isEnable.value
                    ? (val) async {
                        isChecked[index].value = val!;
                        if (isChecked[0].value) {
                          for (int i = 1; i < isChecked.length; i++) {
                            isChecked[i].value = false;
                          }
                        } else if (isChecked[1].value &&
                            isChecked[2].value &&
                            isChecked[3].value &&
                            isChecked[4].value &&
                            isChecked[5].value &&
                            isChecked[6].value &&
                            isChecked[7].value) {
                          for (int i = 0; i < isChecked.length; i++) {
                            isChecked[i].value = false;
                          }
                          isChecked[0].value = true;
                        }
                        storeDays();
                      }
                    : null),
            Text(weekDays[index]),
            isChecked[index].value
                ? Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      // child: Icon(
                      //   FontAwesomeIcons.trashAlt,
                      //   color: Colors.white,
                      //   size: 16,
                      // ),
                    ))
                : Text(""),
          ],
        ));
  }

  getSnack(title, message, position) {
    return Get.snackbar(title, message,
        snackPosition: position ?? SnackPosition.TOP,
        backgroundColor: Colors.grey[200],
        colorText: Colors.red,
        dismissDirection: DismissDirection.horizontal);
  }

  setFevorit() {
    if (isFavorited.value) {
      isFavorited.value = false;
    } else {
      isFavorited.value = true;
    }
    update();
  }

  startTimer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (start <= 0) {
        timer.cancel();
      } else {
        start = start - 1;
      }
    });
    update();
  }
}
