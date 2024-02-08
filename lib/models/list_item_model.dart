import 'package:flutter/material.dart';

class Item {
  Item(
      {required this.id,
      required this.title,
      required this.description,
      required this.icon,
      required this.isSelected});

  int id;
  String title;
  String description;
  IconData icon;
  bool isSelected;
}
