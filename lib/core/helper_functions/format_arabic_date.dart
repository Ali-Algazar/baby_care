import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatArabicDate(String isoDate, BuildContext context) {
  final date = DateTime.parse(isoDate).toLocal();
  final locale = Localizations.localeOf(context).languageCode;

  return DateFormat('d MMMM y', locale).format(date);
}
