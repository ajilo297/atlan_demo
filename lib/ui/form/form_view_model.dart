import 'package:atlan_demo/core/base/base_view_model.dart';
import 'package:atlan_demo/core/services/utility_services.dart';
import 'package:atlan_demo/widgets/mapped_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class FormViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey();
  final UtilityServices _utilityServices;

  List<Map<String, dynamic>> _formMapList;
  List<Map<String, dynamic>> _responseList = [];
  List<MappedWidget> _widgetList = [];
  int _formElementIndex = 0;

  FormViewModel({
    @required UtilityServices utilityServices,
    @required List<Map<String, dynamic>> formMapList,
  })  : this._formMapList = formMapList,
        this._utilityServices = utilityServices;

  List<Map<String, dynamic>> get formMapList => _formMapList;

  int get formElementIndex => _formElementIndex;
  set formElementIndex(int value) {
    _formElementIndex = value;
    notifyListeners();
  }

  List<Map<String, dynamic>> get responseList => _responseList;
  List<MappedWidget> get widgetList => _widgetList;

  void save() {
    log.i('save');
    if (formKey.currentState == null) {
      log.e('save: Form state is null');
      return;
    }
    if (!formKey.currentState.validate()) {
      log.w('save: Validation failed');
      return;
    }
  }

  void addToMappedList(MappedWidget widget) {
    log.i('addToMappedList');
    _widgetList.add(widget);
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }

  String get uuid => _utilityServices.uuid;
}
