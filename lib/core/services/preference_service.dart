import 'dart:convert';

import 'package:atlan_demo/core/base/base_service.dart';
import 'package:atlan_demo/core/models/response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService extends BaseService {
  static const _FORM_KEY = 'FORM_DATA';

  Future<ResponseModel<bool>> saveForm(Map<String, dynamic> formData) async {
    log.i('saveForm');

    String formString;
    try {
      formString = jsonEncode(formData);
    } catch (error) {
      log.e('saveForm: error: $error');
      return ResponseModel(
        status: Status.ERROR,
        message: 'Form could not be converted',
        data: false,
      );
    }

    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      bool result = await preferences.setString(_FORM_KEY, formString);
      if (result) {
        return ResponseModel(
          status: Status.SUCCESS,
          message: 'Data saved',
          data: true,
        );
      } else {
        log.e('saveForm: Could not save to preferences');
        return ResponseModel(
          status: Status.ERROR,
          message: 'Error while saving to local memory',
          data: false,
        );
      }
    } catch (error) {
      log.e('saveForm: error: $error');
      return ResponseModel(
        status: Status.ERROR,
        message: 'Error while loading local storage',
        data: false,
      );
    }
  }

  Future<ResponseModel<Map<String, dynamic>>> getSavedForm() async {
    log.i('getSavedForm:');
    SharedPreferences preferences;
    try {
      preferences = await SharedPreferences.getInstance();
    } catch (error) {
      log.e('getSavedForm: error: $error');
      return ResponseModel(
        status: Status.ERROR,
        message: 'Error while loading local storage',
      );
    }

    String formString;
    try {
      formString = preferences.getString(_FORM_KEY);
    } catch (error) {
      log.e('getSavedForm: error: $error');
      return ResponseModel(
        status: Status.ERROR,
        message: 'Error while parsing string',
      );
    }

    Map<String, dynamic> formData;
    try {
      formData = Map.castFrom(jsonDecode(formString));
    } catch (error) {
      log.e('getSavedForm: error: $error');
      return ResponseModel(
        status: Status.ERROR,
        message: 'Error while parsing JSON',
      );
    }

    return ResponseModel(
      status: Status.SUCCESS,
      message: 'Fetched form data',
      data: formData,
    );
  }
}
