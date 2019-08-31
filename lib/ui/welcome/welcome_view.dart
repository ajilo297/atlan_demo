import 'package:atlan_demo/core/base/base_view.dart';
import 'package:atlan_demo/ui/welcome/welcome_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WelcomeViewModel viewModel = WelcomeViewModel();
    return BaseView<WelcomeViewModel>(
      viewModel: viewModel,
      builder: (context, viewModel, _) {
        return _getView(context, viewModel);
      },
    );
  }

  Widget _getView(BuildContext context, WelcomeViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome View'),
      ),
    );
  }
}
