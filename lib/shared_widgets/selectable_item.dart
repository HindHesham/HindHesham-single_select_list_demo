import 'package:flutter/material.dart';
import 'package:single_select_list_demo/models/list_item_model.dart';
import 'package:single_select_list_demo/shared/constraints.dart';

class SelectableItem extends StatelessWidget {
  final Item item;
  final Function(Item) selectItem;
  const SelectableItem(
      {required this.item, required this.selectItem, super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return ListTile(
      onTap: () {
        selectItem(item);
      },
      leading: Icon(
        item.icon,
        size: screenSize.height * Constraints.iconSize,
        key: const Key(Constraints.itemLeadingIcon),
        color: !item.isSelected
            ? Theme.of(context)
                .colorScheme
                .secondary
                .withOpacity(Constraints.secondaryColorOpacity)
            : Theme.of(context).colorScheme.secondary,
      ),
      title: Text(
        key: const Key(Constraints.itemTitle),
        item.title,
        style: TextStyle(
            fontSize: screenSize.height * Constraints.titleFontSize,
            fontWeight: FontWeight.w500,
            color: !item.isSelected
                ? Theme.of(context)
                    .colorScheme
                    .primary
                    .withOpacity(Constraints.primaryColorOpacity)
                : Theme.of(context).colorScheme.primary),
      ),
      subtitle: (item.isSelected)
          ? Text(
              key: const Key(Constraints.itemSubtitle),
              item.description,
              style: TextStyle(
                  fontSize: screenSize.height * Constraints.detailsFontSize,
                  color: Theme.of(context).colorScheme.secondary),
            )
          : null,
      trailing: (item.isSelected)
          ? Icon(Icons.check_circle_rounded,
              key: const Key(Constraints.itemTrailingIcon),
              size: screenSize.height * Constraints.iconSize,
              color: Theme.of(context).colorScheme.tertiary)
          : null,
    );
  }
}
