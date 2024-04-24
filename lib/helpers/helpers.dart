import 'package:intl/intl.dart';

String formatDate(DateTime datetime) {
  final dateFormat = DateFormat('yyyy-MM-dd');
  return dateFormat.format(datetime);
}
