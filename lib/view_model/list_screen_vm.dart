import 'package:single_select_list_demo/models/list_item_model.dart';

class ListScreenVM {
  void selectItem(Item selectedItem, List<Item> itemsList) {
    for (final item in itemsList) {
      item.isSelected = item.id == selectedItem.id;
    }
  }
}
