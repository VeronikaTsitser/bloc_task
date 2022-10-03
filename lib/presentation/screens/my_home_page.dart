import 'package:bloc_task/logic/bloc/save_bloc.dart';
import 'package:bloc_task/logic/bloc/save_event.dart';

import 'package:bloc_task/logic/bloc/save_state.dart';
import 'package:bloc_task/presentation/screens/history_page.dart';
import 'package:bloc_task/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: '');
    return BlocBuilder<SaveBloc, SaveState>(
        bloc: context.read<SaveBloc>(),
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
              actions: [
                IconButton(
                    onPressed: (() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HistoryPage(),
                        ),
                      );
                    }),
                    icon: const Icon(Icons.history))
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  InputField(
                    controller: controller,
                  ),
                  Text(
                    'counter',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final text = controller.text;
                SaveState currentState = context.read<SaveBloc>().state;
                print(state);

                context.read<SaveBloc>().add(
                      SaveData(
                        textData: text,
                      ),
                    );
                controller.clear();

                print(state);
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        });
  }
}
