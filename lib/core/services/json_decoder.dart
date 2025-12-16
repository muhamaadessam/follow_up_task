import 'dart:convert';

import 'package:flutter/services.dart';

dynamic jsonDecoder(String filePath) async {
  final String response = await rootBundle.loadString(filePath);
  final data = await json.decode(response);
  return data;
}
