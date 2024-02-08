import 'package:flutter/material.dart';
import 'package:single_select_list_demo/models/list_item_model.dart';
import 'package:single_select_list_demo/shared/constraints.dart';
import 'package:single_select_list_demo/shared_widgets/selectable_item.dart';

class ItemList extends StatelessWidget {
  const ItemList(
      {required this.itemsList, required this.selectItem, super.key});
  final List<Item> itemsList;
  final Function(Item, List<Item>) selectItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(Constraints.listBorderRadius),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.all(Constraints.itemPadding),
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Theme.of(context).colorScheme.onSecondary,
          indent: Constraints.dividerIndent,
          endIndent: Constraints.dividerIndent,
        ),
        itemCount: itemsList.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Constraints.listBorderRadius),
              boxShadow: [
                BoxShadow(
                  color: !itemsList[index].isSelected
                      ? Theme.of(context).colorScheme.onPrimaryContainer
                      : Theme.of(context).colorScheme.primaryContainer,
                  blurRadius: Constraints.listBoxShadowRadius,
                  spreadRadius: Constraints.listBoxShadowRadius,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            //Selectable item widget
            child: (SelectableItem(
              item: itemsList[index],
              selectItem: (Item item) => selectItem(item, itemsList),
            )),
          );
        },
      ),
    );
  }
}
