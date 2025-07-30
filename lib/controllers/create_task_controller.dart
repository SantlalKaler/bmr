import 'package:bmr/ui/model/choice_chip_item.dart';
import 'package:get/get.dart';

class CreateTaskController extends GetxController {
  List<ChoiceChipItem> items = [
    ChoiceChipItem(title: "BIKE"),
    ChoiceChipItem(title: "CAR"),
    ChoiceChipItem(title: "BUS"),
    ChoiceChipItem(title: "TRAIN"),
    ChoiceChipItem(title: "FLIGHT"),
    ChoiceChipItem(title: "MEETING"),
  ];

  RxInt selectedItem = 0.obs;
  void setSelectedItem(int index) {
    selectedItem.value = index;
    update();
  }
}
