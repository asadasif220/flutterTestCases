import 'package:flutter/material.dart';
import 'package:flutter_picker_test/data_picker/dialogs/scroll_picker_dialog.dart';

/// Allows selection of a string via a slot machine carousel
void showMaterialScrollPicker({
  BuildContext context,
  String title,
  List<String> items,
  String selectedItem,
  Color headerColor,
  Color headerTextColor,
  Color backgroundColor,
  Color buttonTextColor,
  String confirmText,
  String cancelText,
  double maxLongSide,
  double maxShortSide,
  // bool showDivider: true,
  ValueChanged<String> onChanged,
  VoidCallback onConfirmed,
  VoidCallback onCancelled,
}) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return ScrollPickerDialog(
        items: items,
        title: title,
        initialItem: selectedItem,
        headerColor: headerColor,
        headerTextColor: headerTextColor,
        backgroundColor: backgroundColor,
        buttonTextColor: buttonTextColor,
        confirmText: confirmText,
        cancelText: cancelText,
        maxLongSide: maxLongSide,
        maxShortSide: maxShortSide,
        // showDivider: showDivider,
      );
    },
  ).then((selection) {
    if (onChanged != null && selection != null) onChanged(selection);
    if (onCancelled != null && selection == null) onCancelled();
    if (onConfirmed != null && selection != null) onConfirmed();
  });
}
