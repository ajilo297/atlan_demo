import 'package:flutter/cupertino.dart';

class ResponseModel<T> {
  final Status status;
  final String message;
  final T data;

  ResponseModel({
    @required this.status,
    @required this.message,
    this.data,
  });
}

enum Status { SUCCESS, ERROR, WAITING, UNKNOWN }
