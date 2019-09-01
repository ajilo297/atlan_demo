import 'dart:async';

import 'package:atlan_demo/core/base/base_service.dart';
import 'package:atlan_demo/core/models/response_model.dart';
import 'package:atlan_demo/core/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class FormService extends BaseService {
  ApiService _apiService;

  FormService({
    @required ApiService apiService,
  }) : this._apiService = apiService;

  // ignore: close_sinks
  StreamController<ResponseModel<Map<String, dynamic>>> _formStreamController =
      StreamController<ResponseModel<Map<String, dynamic>>>.broadcast();

  Future loadFormData() async {
    log.i('loadFormData');
    ResponseModel responseModel = await _apiService.getForm();
    _formStreamController.add(responseModel);
  }

  Stream<ResponseModel<Map<String, dynamic>>> get formResponse {
    return _formStreamController.stream;
  }
}
