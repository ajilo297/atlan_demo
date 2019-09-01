import 'package:atlan_demo/core/base/base_view_model.dart';
import 'package:atlan_demo/core/services/api_service.dart';
import 'package:atlan_demo/core/services/form_service.dart';
import 'package:atlan_demo/ui/welcome/welcome_view.dart';
import 'package:flutter/material.dart';

class SplashViewModel extends BaseViewModel {
  final BuildContext context;

  FormService _formService;

  SplashViewModel(
    this.context, {
    @required FormService formService,
  }) : this._formService = formService;

  Future initializeSurveyForm() async {
    log.i('initializeSurveyForm');
    busy = true;
    await _formService.loadFormData();
    busy = false;
    navigateToNextScreen();
  }

  void navigateToNextScreen() {
    log.i('navigateToNextScreen');
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return WelcomeView();
    }));
  }
}
