import 'package:flutter/foundation.dart';


class Error422Model {
  String message;
  Map<String, List> errors;

  Error422Model({this.message = "", required this.errors});

  factory Error422Model.fromJson(Map<String, dynamic> map) {
    return Error422Model(
      message: map['error_message'] ?? "",
      errors: Map<String, List>.from(map['errors'] ?? {}),
    );
  }

  bool get hasMessage => message.isNotEmpty;
  bool get hasErrors => errors.isNotEmpty;

  @override
  bool operator ==(covariant Error422Model other) {
    if (identical(this, other)) return true;

    return message == other.message && mapEquals(other.errors, errors);
  }

  @override
  int get hashCode => message.hashCode ^ errors.hashCode;
}