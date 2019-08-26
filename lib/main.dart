import 'package:atlan_demo/core/providers.dart';
import 'package:atlan_demo/theme/atlan_theme.dart';
import 'package:atlan_demo/ui/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MainApplication());

class MainApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        theme: AtlanTheme.theme,
        home: SplashView(),
      ),
    );
  }
}
