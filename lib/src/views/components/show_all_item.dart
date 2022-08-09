import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/all_todo/all_todo_cubit.dart';

class ShowAllItem extends StatefulWidget {
  const ShowAllItem({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowAllItem> createState() => _ShowAllItemState();
}

class _ShowAllItemState extends State<ShowAllItem> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllTodoCubit>(context).showAll();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AllTodoCubit, AllTodoState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AllTodoEmpty) {
          return const Center(
            child: Text('Empty'),
          );
        } else if (state is AllTodoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is AllTodoLoaded) {
          // dismissLoading();
          return SingleChildScrollView(
            child: Column(
              children: [
                ...List.generate(
                  state.data.length,
                  (i) {
                    final todoDate = DateTime.parse(state.data[i].date);
                    return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${todoDate.day}/${todoDate.month}/${todoDate.year}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.primaries[
                                    Random().nextInt(Colors.primaries.length)],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.primaries[Random()
                                        .nextInt(Colors.primaries.length)],
                                  ),
                                  child: Text(
                                    (state.data[i].title)
                                        .split('')
                                        .first
                                        .toString(),
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        state.data[i].title,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      state.data[i].description != null
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.primaries[
                                                        Random().nextInt(Colors
                                                            .primaries.length)],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Text(
                                                  state.data[i].description ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  // softWrap: false,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 2,
                                                ),
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        } else if (state is AllTodoFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Error'));
        }
      },
    );
  }
}
