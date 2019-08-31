import 'package:atlan_demo/core/base/base_view.dart';
import 'package:atlan_demo/ui/splash/splash_view_model.dart';
import 'package:atlan_demo/widgets/custom_scaffold.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SplashViewModel viewModel = SplashViewModel(
      formService: Provider.of(context),
    );
    return BaseView<SplashViewModel>(
      viewModel: viewModel,
      onModelReady: (viewModel) {
        viewModel.initializeSurveyForm();
      },
      builder: (context, viewModel, _) {
        return _getView(context, viewModel);
      },
    );
  }

  Widget _getView(BuildContext context, SplashViewModel viewModel) {
    return CustomScaffold(
      isLoading: viewModel.busy,
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Game Center'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w300,
                letterSpacing: 2,
                wordSpacing: 1,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Visitor Survey',
              style: TextStyle(
                color: Colors.white.withAlpha(100),
                fontWeight: FontWeight.w800,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
