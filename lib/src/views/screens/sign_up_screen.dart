import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/sign_up_field.dart';

class SignUpAccountScreen extends StatelessWidget {
  const SignUpAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent.withOpacity(0.1),
      ),
      child: const Scaffold(
        body: SignUpField(),
      ),
    );
  }
}
