import 'package:flutter/material.dart';
import 'package:single_select_list_demo/data/items.dart';
import 'package:single_select_list_demo/models/list_item_model.dart';
import 'package:single_select_list_demo/shared/constraints.dart';
import 'package:single_select_list_demo/shared_widgets/item_list.dart';
import 'package:single_select_list_demo/view_model/list_screen_vm.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<Item> itemsList = items;
  final ListScreenVM listScreenVM = ListScreenVM();
  @override
  void initState() {
    super.initState();
  }

  void selectItem(Item selectedItem, List<Item> itemsList) {
    setState(() {
      listScreenVM.selectItem(selectedItem, itemsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Constraints.listPadding),
        child: ItemList(
            itemsList: itemsList,
            selectItem: (Item item, List<Item> itemsList) =>
                selectItem(item, itemsList)),
      ),
    );
  }
}
