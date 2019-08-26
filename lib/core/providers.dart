import 'package:atlan_demo/core/services/database_service.dart';
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
];
List<SingleChildCloneableWidget> _dependentProviders = [];
List<SingleChildCloneableWidget> _consumableProviders = [

];