import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../data/model/user/user_req_model.dart';
import '../../logic/cubit/login_user/user_login_cubit.dart';
import '../screens/home_screen.dart';
import '../screens/sign_up_screen.dart';

class LoginScreenField extends StatefulWidget {
  const LoginScreenField({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreenField> createState() => _LoginScreenFieldState();
}

class _LoginScreenFieldState extends State<LoginScreenField> {
  late final TextEditingController controllerEmail;
  late final TextEditingController controllerPassword;

  late bool _condition;
  late Color color;
  late String email;

  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController();
    controllerPassword = TextEditingController();
    _condition = true;
    color = Colors.green;
    email = 'Email';
  }

  void _login() {
    final user = UserReqModel(
      userEmail: controllerEmail.text,
      userPassword: controllerPassword.text,
    );

    BlocProvider.of<UserLoginCubit>(context).loginUser(user: user);
  }

  @override
  Widget build(BuildContext context) {
    bool isValid = EmailValidator.validate(controllerEmail.text);
    return SingleChildScrollView(
      child: BlocListener<UserLoginCubit, UserLoginState>(
        listener: (context, state) {
          if (state is UserLoginSucess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100,
                backgroundImage:
                    AssetImage('assets/images/Aoi-Todo-skills-1024x1024.jpg'),
              ),
              const SizedBox(height: 50),
              const Text(
                'Welcome~!!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 3.0,
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  controller: controllerEmail,
                  maxLength: 30,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: color),
                    ),
                    labelText: email,
                    hintText: 'Enter Email',
                    prefixIcon: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                      child: FaIcon(FontAwesomeIcons.g),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextField(
                  maxLength: 30,
                  obscureText: _condition,
                  controller: controllerPassword,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    prefixIcon: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                      child: FaIcon(FontAwesomeIcons.p),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _condition ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _condition = !_condition;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isValid ? color = Colors.green : color = Colors.red;
                      isValid
                          ? email = 'Email'
                          : email = 'Please Enter a Valid Email';
                    });
                    _login();
                  },
                  child: const Text(
                    'Log In',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't Have an Account Yet?",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpAccountScreen(),
                      ));
                    },
                    child: RichText(
                      text: const TextSpan(
                        text: 'Sign Up',
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
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (_) => const HomeScreen(),
                  ));
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'Countinue without an Account',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
