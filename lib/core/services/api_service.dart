import 'dart:convert';

import 'package:atlan_demo/core/base/base_service.dart';
import 'package:atlan_demo/core/models/response_model.dart';
import 'package:http/http.dart' as http;

class ApiService extends BaseService {
  static const FORM_URL = 'https://firebasestorage.googleapis.com/v0/b/'
      'collect-plus-6ccd0.appspot.com/o/'
      'mobile_tasks%2F'
      'form_task.json?'
      'alt=media&'
      'token=d048a623-415e-41dd-ad28-8f77e6c546be';

  Future<ResponseModel<Map<String, dynamic>>> getForm() async {
    http.Response response;
    try {
      response = await http.get(FORM_URL);
    } catch (error) {
      log.e('getForm: http.get: error: ${error.toString()}');
      return ResponseModel(
          status: Status.ERROR, message: 'Network request failed');
    }

    try {
      Map<String, dynamic> responseMap = json.decode(response.body);
      log.d('getForm: $responseMap');
      return ResponseModel(
        status: Status.SUCCESS,
        message: 'Fetch and parse successful.',
        data: responseMap,
      );
    } catch (error) {
      log.e('getForm: responseMap: error: ${error.toString()}');
      return ResponseModel(
          status: Status.ERROR, message: 'Error while parsing data');
    }
  }
}
