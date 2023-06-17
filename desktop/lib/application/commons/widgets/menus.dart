

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

typedef Callback<T> = void Function(T value);
typedef ValueCallback<R> = R Function();


class SelectorDropDown<T> extends StatelessWidget {
  const SelectorDropDown(
      {Key? key,
      this.items,
      this.label,
      required this.onSelect,
      required this.initialSelection, 
      this.itemBuilder})
      : super(key: key);

  final List<DropdownMenuItem<T>>? items;
  final Widget? label;
  final ValueListenable<T?> initialSelection;
  final Callback<T> onSelect;
  final ValueCallback<List<DropdownMenuItem<T>>?>? itemBuilder;

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder<T?>(
      valueListenable: initialSelection,
      builder: (context,value,child) {

        final dropdownItems = items ?? itemBuilder!();

        return DropdownButton<T>(
            hint: label,
            isExpanded: true,
            value: value,
            items: dropdownItems,
            onChanged: (T? value) {
              if (value != null) {
                onSelect(value);
              }
            });
      }
    );
  }
}
