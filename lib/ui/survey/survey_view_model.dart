import 'package:atlan_demo/core/base/base_view_model.dart';
import 'package:flutter/material.dart';

class SurveyViewModel extends BaseViewModel {
  Map<String, dynamic> _formMap;

  SurveyViewModel({
    @required Map<String, dynamic> formMap,
  })  : this._formMap = formMap {
    log.d('constructor: formMap: ${formMap.toString()}');
  }

  Map<String, dynamic> get formMap => _formMap;
}
