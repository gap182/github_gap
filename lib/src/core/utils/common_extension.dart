import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String format() {
    return DateFormat.yMd().format(this);
  }

  String hourFormat() {
    return DateFormat.yMd().add_jm().format(this);
  }
}
