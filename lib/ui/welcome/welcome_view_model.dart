import 'package:atlan_demo/core/base/base_view_model.dart';
import 'package:atlan_demo/ui/form/form_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WelcomeViewModel extends BaseViewModel {
  List<Map<String, dynamic>> _welcomeMap;

  WelcomeViewModel({
    @required List<Map<String, dynamic>> welcomeMapList,
  }) : this._welcomeMap = welcomeMapList {
    log.d('constructor: welcomeMap: ${welcomeMapList.toString()}');
  }

  List<Map<String, dynamic>> get welcomeMap => _welcomeMap;

  void loadSurveyForm(BuildContext context) {
    log.i('loadSurveyForm');
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => FormView(),
      ),
    );
  }
}
