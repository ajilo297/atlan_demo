import 'package:atlan_demo/core/base/base_view.dart';
import 'package:atlan_demo/ui/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SplashViewModel viewModel = SplashViewModel();
    return BaseView<SplashViewModel>(
      viewModel: viewModel,
      builder: (context, viewModel, _) {
        return _getView(context, viewModel);
      },
    );
  }

  Widget _getView(BuildContext context, SplashViewModel viewModel) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/atlan.svg',
              color: Colors.white,
            ),
            SizedBox(height: 12),
            Text(
              'Visitor Survey',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 4,
                  wordSpacing: 2),
            ),
          ],
        ),
      ),
    );
  }
}
