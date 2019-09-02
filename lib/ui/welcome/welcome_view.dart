import 'package:atlan_demo/core/base/base_view.dart';
import 'package:atlan_demo/core/models/response_model.dart';
import 'package:atlan_demo/ui/welcome/welcome_view_model.dart';
import 'package:atlan_demo/widgets/custom_scaffold.dart';
import 'package:atlan_demo/widgets/mapped_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponseModel<Map<String, dynamic>> responseModel =
        Provider.of<ResponseModel<Map<String, dynamic>>>(context);
    WelcomeViewModel viewModel = WelcomeViewModel(
      welcomeMapList: responseModel.data.containsKey('welcome_screens')
          ? List.castFrom(responseModel.data['welcome_screens'])
          : [],
    );

    return BaseView<WelcomeViewModel>(
      viewModel: viewModel,
      builder: (context, viewModel, _) {
        return _getView(context, viewModel);
      },
    );
  }

  Widget _getView(BuildContext context, WelcomeViewModel viewModel) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: MappedWidget.fromMap(
          viewModel.welcomeMap.length > 0
              ? viewModel.welcomeMap.elementAt(0)
              : {},
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          padding: EdgeInsets.all(16),
          onTap: () => viewModel.loadSurveyForm(context),
          isField: false,
        ),
      ),
    );
  }
}
