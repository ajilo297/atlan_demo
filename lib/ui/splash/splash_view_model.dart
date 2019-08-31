import 'package:atlan_demo/core/base/base_view_model.dart';
import 'package:atlan_demo/core/services/api_service.dart';
import 'package:atlan_demo/core/services/form_service.dart';
import 'package:flutter/material.dart';

class SplashViewModel extends BaseViewModel {
  FormService _formService;

  SplashViewModel({
    @required FormService formService,
  }) : this._formService = formService;

  Future initializeSurveyForm() async {
    log.i('initializeSurveyForm');
    busy = true;
    await _formService.loadFormData();
    busy = false;
  }
}
