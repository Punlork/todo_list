import 'package:flutter/material.dart';

import '../components/show_all_item.dart';

class ShowAllScreen extends StatelessWidget {
  const ShowAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show All To Do'),
        centerTitle: true,
      ),
      body: const ShowAllItem(),
    );
  }
}
