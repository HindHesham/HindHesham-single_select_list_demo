import 'package:flutter_test/flutter_test.dart';
import 'package:single_select_list_demo/data/items.dart';
import 'package:single_select_list_demo/models/list_item_model.dart';
import 'package:single_select_list_demo/shared/app_icon_icons.dart';
import 'package:single_select_list_demo/view_model/list_screen_vm.dart';

void main() {
  test('selectItem should select the correct item', () {
    // Arrange
    final ListScreenVM listScreenVM = ListScreenVM();
    final List<Item> testItemsList =
        List.from(items); // Create a copy of the items list to prevent mutation

    // Act
    listScreenVM.selectItem(
        testItemsList[1], testItemsList); // Selecting the second item

    // Assert
    expect(testItemsList[0].isSelected, false);
    expect(testItemsList[1].isSelected, true); // Selected item should be true
    expect(testItemsList[2].isSelected, false);
  });

  test('selectItem should not select any item if selectedItem is not found',
      () {
    // Arrange
    final ListScreenVM listScreenVM = ListScreenVM();
    final List<Item> testItemsList =
        List.from(items); // Create a copy of the items list to prevent mutation
    final selectedItem = Item(
        id: 100,
        title: 'Unknown',
        description: 'Unknown',
        icon: AppIcon.cotton,
        isSelected: false);

    // Act
    listScreenVM.selectItem(selectedItem, testItemsList);

    // Assert
    expect(testItemsList[0].isSelected, false);
    expect(testItemsList[1].isSelected, false);
    expect(testItemsList[2].isSelected, false);
    // Verify that no item is selected since the selectedItem is not found in the items list
  });
}
