import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bridge.dart';
import 'core/inject/inject.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_themes.dart';
import 'features/active_variation/presentation/ui/pages/home_page.dart';

void main() {
  Inject.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ColorsApp.i.backgroundColor,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Variacao Ativo',
      theme: theme(),
      home: const CommunicationWithNativeWidget(),
    );
  }
}

class CommunicationWithNativeWidget extends StatefulWidget {
  const CommunicationWithNativeWidget({super.key});

  @override
  State<CommunicationWithNativeWidget> createState() =>
      _CommunicationWithNativeWidgetState();
}

class ApiHandler implements FApi {
  final Function(bool) callBack;

  ApiHandler(this.callBack);

  @override
  void currentState(bool state) {
    callBack(state);
  }
}

class _CommunicationWithNativeWidgetState
    extends State<CommunicationWithNativeWidget> {
  var state = true;

  @override
  void initState() {
    super.initState();
    FApi.setup(ApiHandler(currentState));
  }

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }

  void currentState(bool state) {
    setState(() {
      this.state = state;
    });
  }
}
