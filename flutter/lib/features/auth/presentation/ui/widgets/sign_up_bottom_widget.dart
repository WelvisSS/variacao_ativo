import 'package:flutter/material.dart';

class SignUpBottomWidget extends StatelessWidget {
  const SignUpBottomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 386,
      height: 58,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFFCD535),
          onPrimary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Cadastre-se',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
