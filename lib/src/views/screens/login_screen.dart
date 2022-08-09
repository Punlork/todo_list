import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/login_screen_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent.withOpacity(0.1),
      ),
      child: const Scaffold(
        body: Center(
          child: LoginScreenField(),
        ),
      ),
    );
  }
}
