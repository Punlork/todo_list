import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/pages/index_pages_cubit.dart';
import 'add_to_do_screen.dart';
import 'show_all_screen.dart';
import 'to_do_item_screen.dart';
import 'user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static final List<Widget> _pages = <Widget>[
    const TodoItemScreen(),
    const AddToDoScreen(),
    const UserScreen(),
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // BlocProvider.of<AllTodoCubit>(context).resetState();
        // BlocProvider.of<AllTodoCubit>(context).loadData();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Simple To Do'),
          elevation: 0,
          centerTitle: true,
        ),
        body: BlocBuilder<IndexPagesCubit, IndexPagesState>(
          builder: (context, state) => IndexedStack(
            index: state.selectedPage,
            children: HomeScreen._pages,
          ),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ShowAllScreen(),
                ),
              );
            },
            child: const Icon(
              Icons.expand_less_rounded,
              size: 50,
              color: Colors.green,
            ),
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar:
            BlocSelector<IndexPagesCubit, IndexPagesState, int>(
          selector: (state) {
            return state.selectedPage;
          },
          builder: (context, state) {
            return BottomAppBar(
              shape: const CircularNotchedRectangle(),
              color: Colors.green,
              notchMargin: 10,
              elevation: 30,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () => BlocProvider.of<IndexPagesCubit>(context)
                          .onTapedIndex(0),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: () => BlocProvider.of<IndexPagesCubit>(context)
                        .onTapedIndex(1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 110),
                    child: IconButton(
                      icon: const Icon(Icons.people, color: Colors.white),
                      onPressed: () => BlocProvider.of<IndexPagesCubit>(context)
                          .onTapedIndex(2),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
