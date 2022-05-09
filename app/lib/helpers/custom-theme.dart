

import 'package:app/helpers/static-data.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/linearicons_free_icons.dart';

FilledTextBox(Widget prefix){
  return InputDecoration(
    prefixIcon: prefix,
    filled: true,
    fillColor: DefaultColors.filled,
    contentPadding: const EdgeInsets.only(bottom: 16, top: 16, left: 12),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: DefaultColors.grey.withOpacity(0.7)),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: DefaultColors.filled_border),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: DefaultColors.danger),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: DefaultColors.danger),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
