import 'package:atlan_demo/core/models/response_model.dart';
import 'package:atlan_demo/core/services/api_service.dart';
import 'package:atlan_demo/core/services/database_service.dart';
import 'package:atlan_demo/core/services/form_service.dart';
import 'package:atlan_demo/core/services/preference_service.dart';
import 'package:provider/provider.dart';

List<SingleChildCloneableWidget> providers = [
  ..._independentProviders,
  ..._dependentProviders,
  ..._consumableProviders,
];
List<SingleChildCloneableWidget> _independentProviders = [
  Provider.value(value: PreferenceService()),
  Provider.value(value: DatabaseService()),
  Provider.value(value: ApiService()),
];

List<SingleChildCloneableWidget> _dependentProviders = [
  ProxyProvider<ApiService, FormService>(
    builder: (context, apiService, formService) {
      return FormService(apiService: apiService);
    },
  )
];

List<SingleChildCloneableWidget> _consumableProviders = [
  StreamProvider<ResponseModel>(
    builder: (context) {
      return Provider.of<FormService>(
        context,
        listen: false,
      ).formResponse;
    },
  ),
];
