import 'package:get/get.dart';

class ProfileController extends GetxController {
  int switchValue = 1;
  int groupValue = 0;
  double quantity = 0.5;
  String selectLeaveType = "Select";
  List leaveTypes = [
    'Select',
    'Casual leave',
    'Medical Leave',
    'Restricted Leave',
    'Paid Leave',
  ];

  String selectWork = "Select";
  List workTypes = [
    'Select',
    'WFH ',
    'WFCO ',
  ];

  leaveDrop(val) {
    selectLeaveType = val;
    update();
  }

  workDrop(val) {
    leaveTypes.clear();
    update();
  }

  // radioButton(e) {
  //   switch (e) {
  //     case 1:
  //       {
  //         quantity = 0.5;
  //         groupValue = e;
  //         break;
  //       }
  //     case 2:
  //       {
  //         quantity = 1;
  //         groupValue = e;
  //         break;
  //       }
  //   }
  //   update();
  // }

  setCheck(e) {
    switch (e) {
      case 1:
        {
          switchValue = 1;
          break;
        }
      case 2:
        {
          switchValue = 2;
          break;
        }
    }
    update();
  }
}
