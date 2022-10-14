import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String formatToAppDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
