import 'package:flutter/material.dart';

import '../../../../active_variation/presentation/ui/pages/home_page.dart';

class LoginBottomWidget extends StatelessWidget {
  const LoginBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 386,
      height: 58,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (route) => false,
          );
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          onPrimary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Entrar',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
