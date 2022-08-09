import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../common/functions.dart';
import '../../data/model/user/user_req_model.dart';
import '../../logic/cubit/register_user/create_user_cubit.dart';

import '../screens/login_screen.dart';

class SignUpField extends StatefulWidget {
  const SignUpField({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpField> createState() => _SignUpFieldState();
}

class _SignUpFieldState extends State<SignUpField> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _rePasswordController;
  late bool _condition;
  late Color _colorEmail;
  late Color _colorPassword;
  late String _emailWarning;
  late String _passwordWarning;
  late String _rePasswordWarning;
  @override
  void initState() {
    super.initState();
    _condition = true;
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _rePasswordController = TextEditingController();
    _colorEmail = Colors.green;
    _colorPassword = Colors.green;
    _emailWarning = 'Email';
    _passwordWarning = 'Password';
    _rePasswordWarning = 'Confirm Password';
  }

  void _registerUser() {
    final userAccount = UserReqModel(
      userEmail: _emailController.text,
      userPassword: _passwordController.text,
    );
    BlocProvider.of<CreateUserCubit>(context).registerUser(user: userAccount);
  }

  TextField customPasswordTextField() {
    return TextField(
      obscureText: _condition,
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: _passwordWarning,
        hintText: 'Enter Password',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _colorPassword,
          ),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(10.0),
          child: FaIcon(FontAwesomeIcons.p),
        ),
        suffixIcon: IconButton(
          icon: Icon(_condition ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _condition = !_condition;
            });
          },
        ),
      ),
    );
  }

  TextField customRePasswordTextField() {
    return TextField(
      obscureText: _condition,
      controller: _rePasswordController,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _colorPassword,
          ),
        ),
        labelText: _rePasswordWarning,
        hintText: 'Re-enter Password',
        prefixIcon: const Padding(
          padding: EdgeInsets.all(10.0),
          child: FaIcon(FontAwesomeIcons.c),
        ),
        suffixIcon: IconButton(
          icon: Icon(_condition ? Icons.visibility_off : Icons.visibility),
          onPressed: () {
            setState(() {
              _condition = !_condition;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isValid = EmailValidator.validate(_emailController.text);
    return SingleChildScrollView(
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'Register Your Todo Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
              ),
              // const SizedBox(height: 50),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 15.0),
              //   child: TextField(
              //     maxLength: 20,
              //     decoration: InputDecoration(
              //       labelText: 'Username',
              //       hintText: 'Enter Username',
              //       prefixIcon: Padding(
              //         padding: EdgeInsets.all(10.0),
              //         child: FaIcon(FontAwesomeIcons.u),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: CustomEmailTextField(
                  emailController: _emailController,
                  emailWarning: _emailWarning,
                  colorEmail: _colorEmail,
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: customPasswordTextField(),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: customRePasswordTextField(),
              ),
              const SizedBox(height: 50),
              BlocListener<CreateUserCubit, CreateUserState>(
                listener: (context, state) {
                  if (state is CreateUserLoading) {
                    loading();
                  } else if (state is CreateUserSucess) {
                    dismissLoading();
                  } else if (state is CreateUserFailure) {
                    dismissLoading();
                  }
                },
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isValid
                            ? _colorEmail = Colors.green
                            : _colorEmail = Colors.red;
                        isValid
                            ? _emailWarning = 'Email'
                            : _emailWarning = 'Please Enter a Valid Email';
                        if (_passwordController.text ==
                            _rePasswordController.text) {
                          _registerUser();
                        } else {
                          // _colorPassword = Colors.g
                          _passwordWarning = 'Password is not the same';
                          _rePasswordWarning = 'Password is not the same';
                        }
                      });
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already had an Account?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomEmailTextField extends StatelessWidget {
  const CustomEmailTextField({
    Key? key,
    required TextEditingController emailController,
    required String emailWarning,
    required Color colorEmail,
  })  : _emailController = emailController,
        _emailWarning = emailWarning,
        _colorEmail = colorEmail,
        super(key: key);

  final TextEditingController _emailController;
  final String _emailWarning;
  final Color _colorEmail;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _emailController,
      decoration: InputDecoration(
        labelText: _emailWarning,
        hintText: 'Enter Email',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: _colorEmail,
          ),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.all(10.0),
          child: FaIcon(FontAwesomeIcons.g),
        ),
      ),
    );
  }
}
