import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/tasks/create_item_cubit.dart';

class TodoItemScreen extends StatefulWidget {
  const TodoItemScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TodoItemScreen> createState() => _TodoItemScreenState();
}

class _TodoItemScreenState extends State<TodoItemScreen> {
  final date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateItemCubit, CreateItemState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(Icons.navigate_before),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          '${date.day}/${date.month}/${date.year}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        // getApi.gethttp();
                      });
                    },
                    icon: const Icon(Icons.navigate_next),
                  ),
                ],
              ),
              // ...List.generate(
              //   state.addItem.length,
              //   (i) {
              //     final todo = state.addItem[i];
              //     return Container(
              //       padding: const EdgeInsets.all(10),
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             todo.title,
              //             style: const TextStyle(
              //               fontSize: 20,
              //               fontWeight: FontWeight.w500,
              //             ),
              //           ),
              //           Container(
              //             padding: const EdgeInsets.symmetric(vertical: 10),
              //             decoration: BoxDecoration(
              //               border: Border.all(
              //                 color: Colors.primaries[
              //                     Random().nextInt(Colors.primaries.length)],
              //               ),
              //               borderRadius: BorderRadius.circular(10),
              //             ),
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceAround,
              //               children: [
              //                 Container(
              //                   padding: const EdgeInsets.all(20),
              //                   decoration: BoxDecoration(
              //                     shape: BoxShape.circle,
              //                     color: Colors.primaries[Random()
              //                         .nextInt(Colors.primaries.length)],
              //                   ),
              //                   child: Text(
              //                     ('').split('').first.toString(),
              //                     style: const TextStyle(
              //                       fontSize: 20,
              //                       fontWeight: FontWeight.w500,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                 ),
              //                 Column(
              //                   children: [
              //                     const Text(
              //                       '',
              //                       style: TextStyle(
              //                           fontSize: 20,
              //                           fontWeight: FontWeight.w500),
              //                     ),
              //                     const SizedBox(
              //                       height: 10,
              //                     ),
              //                     Container(
              //                       padding: const EdgeInsets.all(5),
              //                       decoration: BoxDecoration(
              //                         border: Border.all(
              //                           color: Colors.primaries[Random()
              //                               .nextInt(Colors.primaries.length)],
              //                         ),
              //                         borderRadius: BorderRadius.circular(10),
              //                       ),
              //                       child: const Text(
              //                         '',
              //                         style: TextStyle(
              //                             fontSize: 15,
              //                             fontWeight: FontWeight.w500),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
              //     );
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }
}
