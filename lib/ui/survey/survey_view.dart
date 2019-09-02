import 'package:atlan_demo/core/base/base_view.dart';
import 'package:atlan_demo/core/models/response_model.dart';
import 'package:atlan_demo/ui/survey/survey_view_model.dart';
import 'package:atlan_demo/ui/welcome/welcome_view.dart';
import 'package:atlan_demo/widgets/custom_scaffold.dart';
import 'package:atlan_demo/widgets/mapped_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurveyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ResponseModel<Map<String, dynamic>> responseModel =
        Provider.of<ResponseModel<Map<String, dynamic>>>(context);
    SurveyViewModel viewModel = SurveyViewModel(
      formMap: responseModel.status == Status.SUCCESS ? responseModel.data : {},
    );
    return BaseView<SurveyViewModel>(
      viewModel: viewModel,
      builder: (context, viewModel, _) {
        return _getView(context, viewModel);
      },
    );
  }

  Widget _getView(BuildContext context, SurveyViewModel viewModel) {
    return WelcomeView();
  }
}
