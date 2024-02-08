import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:single_select_list_demo/data/items.dart';
import 'package:single_select_list_demo/models/list_item_model.dart';
import 'package:single_select_list_demo/shared/constraints.dart';
import 'package:single_select_list_demo/shared_widgets/selectable_item.dart';
import 'package:single_select_list_demo/views/list_screen.dart';

void main() {
  testWidgets('ListScreen UI Test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: ListScreen(),
    ));

    //Test that the app renders properly in light theme
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData.light(),
      home: const ListScreen(),
    ));

    //Test that the app renders properly in dark theme
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData.dark(),
      home: const ListScreen(),
    ));

    // Verify that List items are displayed.
    expect(find.byType(SelectableItem), findsNWidgets(items.length));

    // Verify that the list contains the correct number of items.
    expect(find.byType(ListTile), findsNWidgets(items.length));
  });

  testWidgets('SelectableItem UI Test', (WidgetTester tester) async {
    // Create a mock Item
    final item = Item(
      id: 1,
      title: 'Test Item',
      description: 'Test Description',
      icon: Icons.access_alarm,
      isSelected: true,
    );

    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SelectableItem(
          item: item,
          selectItem: (Item selectedItem) {
            // Mock selectItem function
          },
        ),
      ),
    ));
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: SelectableItem(
          item: item,
          selectItem: (Item selectedItem) {
            // Mock selectItem function
          },
        ),
      ),
    ));

    // Verify that ListTile exists.
    expect(find.byType(ListTile), findsOneWidget);
    // Verify that ListTile's leading widget is Icon.
    expect(find.byKey(const Key(Constraints.itemLeadingIcon)), findsOneWidget);

    // Verify that ListTile's title widget is Text.
    expect(find.byKey(const Key(Constraints.itemTitle)), findsOneWidget);

    expect(find.byKey(const Key(Constraints.itemSubtitle)),
        findsOneWidget); // Subtitle should be visibl
    expect(find.byKey(const Key(Constraints.itemTrailingIcon)),
        findsOneWidget); // Trailing icon should be visible after selecting

    // To confirm that the MaterialApp is now in dark theme
    expect(
      Theme.of(tester.element(find.byKey(const Key(Constraints.itemTitle))))
          .brightness,
      equals(Brightness.dark),
      reason:
          "Since MaterialApp() was set to dark theme when it was built at tester.pumpWidget(), the MaterialApp should be in dark theme",
    );
    expect(
      Theme.of(tester.element(find.byKey(const Key(Constraints.itemTitle))))
          .brightness,
      equals(Brightness.dark),
      reason:
          "Since MaterialApp() was set to dark theme when it was built at tester.pumpWidget(), the MaterialApp should be in dark theme",
    );

    expect(
      Theme.of(tester.element(find.byKey(const Key(Constraints.itemSubtitle))))
          .brightness,
      equals(Brightness.dark),
      reason:
          "Since MaterialApp() was set to dark theme when it was built at tester.pumpWidget(), the MaterialApp should be in dark theme",
    );
    expect(
      Theme.of(tester
              .element(find.byKey(const Key(Constraints.itemTrailingIcon))))
          .brightness,
      equals(Brightness.dark),
      reason:
          "Since MaterialApp() was set to dark theme when it was built at tester.pumpWidget(), the MaterialApp should be in dark theme",
    );

    // Tap on ListTile to select the item.
    await tester.tap(find.byType(ListTile));

    // Rebuild the widget with the updated state.
    await tester.pump();

    // Verify ListTile's title and leadingIcon is shown when isSelected is false.
    expect(find.byKey(const Key(Constraints.itemTitle)), findsOneWidget);
    expect(
        find.byKey(const Key(Constraints.itemTitle)), findsOneWidget); // title

    // Verify ListTile's subtitle and TrailingIcon is not shown when isSelected is false.
    expect(find.text(Constraints.itemSubtitle), findsNothing);
    expect(find.text(Constraints.itemTrailingIcon), findsNothing);
  });
}
