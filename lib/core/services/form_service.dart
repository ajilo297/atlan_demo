import 'dart:async';
import 'package:flutter/foundation.dart';

import 'package:atlan_demo/core/base/base_service.dart';
import 'package:atlan_demo/core/models/response_model.dart';
import 'package:atlan_demo/core/services/api_service.dart';
import 'package:atlan_demo/core/services/preference_service.dart';

class FormService extends BaseService {
  ApiService _apiService;
  PreferenceService _preferenceService;

  FormService({
    @required ApiService apiService,
    @required PreferenceService preferenceService,
  })  : this._apiService = apiService,
        this._preferenceService = preferenceService;

  // ignore: close_sinks
  StreamController<ResponseModel<Map<String, dynamic>>> _formStreamController =
      StreamController<ResponseModel<Map<String, dynamic>>>.broadcast();

  /// Checks if the form data is saved in the SharedPreference. Else fetches
  /// from API. The form data is then added to [_formStreamController]
  Future loadFormData() async {
    log.i('loadFormData');
    ResponseModel<Map<String, dynamic>> responseModel;

    responseModel = await _formFromPreferences;
    if (responseModel.status == Status.SUCCESS) {
      log.i('loadFormData: preferences: ${responseModel.message}');
      _formStreamController.add(responseModel);
      return;
    }
    log.w('loadFormData: ${responseModel.message}');

    responseModel = await _formFromApi;
    if (responseModel.status == Status.SUCCESS) {
      log.i('loadFormData: Api: ${responseModel.message}');
      _formStreamController.add(responseModel);
      return;
    }

    _formStreamController.add(null);
  }

  Future<ResponseModel<Map<String, dynamic>>> get _formFromPreferences async {
    log.i('_formFromPreferences');
    ResponseModel<Map<String, dynamic>> formData =
        await _preferenceService.getSavedForm();
    return formData;
  }

  Future<ResponseModel<Map<String, dynamic>>> get _formFromApi async {
    log.i('_formFromApi');
    ResponseModel<Map<String, dynamic>> formData;
    formData = await _apiService.getForm();
    if (formData.status == Status.SUCCESS) {
      await _preferenceService.saveForm(formData.data);
    }
    return formData;
  }

  Stream<ResponseModel<Map<String, dynamic>>> get formResponse {
    return _formStreamController.stream;
  }
}
