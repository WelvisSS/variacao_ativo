import 'package:flutter/material.dart';
import 'bridge.dart';
import 'core/inject/inject.dart';
import 'features/active_variation/presentation/ui/pages/home_page.dart';
import 'package:flutter/services.dart';

void main() {
  Inject.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF2C77BB),
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Variacao Ativo',
      theme: ThemeData.light(),
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
