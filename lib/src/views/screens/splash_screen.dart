import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../exceptions/bad_request_exception.dart';
import '../../logic/cubit/check_token/check_token_cubit.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CheckTokenCubit>(context).checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckTokenCubit, CheckTokenState>(
      listener: (context, state) {
        try {
          if (state is CheckTokenAuthenticated) {
            Timer(
              const Duration(seconds: 3),
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return const HomeScreen();
                  },
                ),
              ),
            );
          } else if (state is CheckTokenUnAuthenticated) {
            Timer(
              const Duration(seconds: 3),
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return const LoginScreen();
                  },
                ),
              ),
            );
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => const LoginScreen(),
            //   ),
            // );
          } else {
            throw RestBadRequestException(message: 'Error');
          }
        } catch (e) {
          throw RestBadRequestException(message: 'Damn');
        }
      },
      child: Center(
        child: Image.asset(
          'assets/images/cartoon-snail-loading-loading-gif-animation_2734139.gif',
        ),
      ),
    );
  }
}
