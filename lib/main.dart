import 'package:flutter/material.dart';
import 'package:single_select_list_demo/shared/theme.dart';
import 'package:single_select_list_demo/views/list_screen.dart';

void main() {
  runApp(const SingleSelectListDemo());
}

class SingleSelectListDemo extends StatelessWidget {
  const SingleSelectListDemo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ListScreen(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
