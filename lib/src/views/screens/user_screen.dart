import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/logout/user_logout_cubit.dart';
import 'login_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _userLogout() {
      BlocProvider.of<UserLogoutCubit>(context).logout();
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.greenAccent,
            radius: 110,
            child: CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage(
                'assets/images/png-clipart-user-profile-computer-icons-login-user-avatars-monochrome-black-thumbnail.png',
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Chek Punlork',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          BlocListener<UserLogoutCubit, UserLogoutState>(
            listener: (context, state) {
              if (state is UserLogoutSucess) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                );
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _userLogout(),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
