// ignore_for_file: non_constant_identifier_names

import 'package:logger/logger.dart';

var _logger = Logger(
    // printer: PrettyPrinter(
    //   methodCount: 0,
    // ),
    );

LogV(String msg) {
  _logger.t(msg);
}

LogD(String msg) {
  _logger.d(msg);
}

LogI(String msg) {
  _logger.i(msg);
}

LogW(String msg) {
  _logger.w(msg);
}

LogE(String msg) {
  _logger.e(msg);
}

LogWTF(String msg) {
  _logger.f(msg);
}
