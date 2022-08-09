import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'src/logic/cubit/logout/user_logout_cubit.dart';
import 'storage_util.dart';

import 'src/logic/cubit/all_todo/all_todo_cubit.dart';
import 'src/logic/cubit/check_token/check_token_cubit.dart';
import 'src/logic/cubit/login_user/user_login_cubit.dart';
import 'src/logic/cubit/pages/index_pages_cubit.dart';
import 'src/logic/cubit/register_user/create_user_cubit.dart';
import 'src/logic/cubit/tasks/create_item_cubit.dart';
import 'src/views/screens/splash_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageUtil.init();
  runApp(const MyApp(title: 'Simple To Do'));
}

class MyApp extends StatelessWidget {
  final String title;

  const MyApp({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => IndexPagesCubit()),
        BlocProvider(create: (_) => CreateItemCubit()),
        BlocProvider(create: (_) => AllTodoCubit()),
        BlocProvider(create: (_) => CreateUserCubit()),
        BlocProvider(create: (_) => UserLoginCubit()),
        BlocProvider(create: (_) => CheckTokenCubit()),
        BlocProvider(create: (_) => UserLogoutCubit()),
      ],
      child: MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        builder: EasyLoading.init(),
        home: const Scaffold(
          body: SplashScreen(),
        ),
      ),
    );
  }
}
