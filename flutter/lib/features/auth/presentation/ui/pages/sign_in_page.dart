import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../controllers/auth_controller.dart';
import '../widgets/login_bottom_widget.dart';
import '../widgets/logo_widget.dart';
import '../widgets/sign_up_bottom_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final AuthController _controller;

  @override
  void initState() {
    super.initState();
    _controller = GetIt.I.get<AuthController>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
          top: 45,
          bottom: 0,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              ColorsApp.i.backgroundColor,
              ColorsApp.i.backgroundColor,
              Colors.black,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100),
            const LogoWidget(),
            Expanded(child: Container()),
            const SignUpBottomWidget(),
            const SizedBox(height: 20),
            const LoginBottomWidget(),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
