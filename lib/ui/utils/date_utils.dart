import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String toUiDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}
