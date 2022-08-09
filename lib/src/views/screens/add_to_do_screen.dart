import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../common/functions.dart';
import '../../data/model/todo/todo_req_model.dart';

import '../../logic/cubit/tasks/create_item_cubit.dart';
import '../components/add_item_screen_buttons.dart';
import '../components/add_item_text_field.dart';

class AddToDoScreen extends StatefulWidget {
  const AddToDoScreen({Key? key}) : super(key: key);

  @override
  State<AddToDoScreen> createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  late TextEditingController _todoController;
  late TextEditingController _descriptionContoller;
  // late double _opacity;
  late String _status;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _todoController = TextEditingController();
    _descriptionContoller = TextEditingController();
    _status = '';
    _selectedDate = DateTime.now();
  }

  void _createTodo() {
    final reqTodo = ProductReqModel(
      title: _todoController.text,
      description:
          _descriptionContoller.text.isEmpty ? '' : _descriptionContoller.text,
      isCompleted: true,
      // date: _selectedDate,
    );
    BlocProvider.of<CreateItemCubit>(context).addTodo(reqTodo);
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: const Center(
          child: Text(
        'Set To Do Status',
        style: TextStyle(fontWeight: FontWeight.w400),
      )),
      actions: [
        Center(
          child: Column(
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    _status = 'Completed';
                  });

                  Navigator.of(context).pop();
                },
                icon: const FaIcon(FontAwesomeIcons.c),
                label: const Text('Completed'),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    _status = 'On Going';
                  });
                  Navigator.of(context).pop();
                },
                icon: const FaIcon(FontAwesomeIcons.o),
                label: const Text('On Going'),
              ),
              OutlinedButton.icon(
                onPressed: () {
                  setState(() {
                    _status = 'Not Yet Started';
                  });
                  Navigator.of(context).pop();
                },
                icon: const FaIcon(FontAwesomeIcons.n),
                label: const Text('Not Yet Started'),
              ),
            ],
          ),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (context) {
        return alert;
      },
    );
  }

  AnimatedOpacity animatedOpacity(String text) {
    return AnimatedOpacity(
      opacity: 1,
      duration: const Duration(
        milliseconds: 500,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              CustomTextField(
                hintText: 'Add Todo',
                controller: _todoController,
              ),
              const SizedBox(height: 10),
              CustomTextField(
                hintText: 'Add Todo Description',
                controller: _descriptionContoller,
              ),
              const SizedBox(height: 10),
              AddItemScreenButtons(
                title: 'Select Status',
                icon: const FaIcon(FontAwesomeIcons.objectGroup),
                onPressed: () {
                  return showAlertDialog(context);
                },
              ),
              const SizedBox(height: 10),
              animatedOpacity('Status: $_status'),
              const SizedBox(height: 10),
              animatedOpacity(
                "Date: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AddItemScreenButtons(
                    title: 'Clear',
                    icon: const FaIcon(FontAwesomeIcons.x),
                    onPressed: () {
                      _todoController.clear();
                      _descriptionContoller.clear();
                    },
                  ),
                  const SizedBox(width: 20),
                  BlocListener<CreateItemCubit, CreateItemState>(
                    listener: (context, state) {
                      if (state is CreateTodoSuccess) {
                        dismissLoading();
                      } else if (state is CreateTodoFailure) {
                        dismissLoading();
                      } else if (state is CreateTodoLoading) {
                        loading();
                      } else if (state is CreateTodoValidationFailure) {
                        dismissLoading();
                      }
                    },
                    child: AddItemScreenButtons(
                      title: 'Add Todo',
                      icon: const FaIcon(FontAwesomeIcons.plus),
                      onPressed: () {
                        _createTodo();
                        _todoController.clear();
                        _descriptionContoller.clear();
                        _selectedDate;
                      },
                    ),
                  ),
                  //
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
