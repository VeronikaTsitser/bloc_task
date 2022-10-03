import 'package:bloc_task/logic/bloc/save_bloc.dart';
import 'package:bloc_task/logic/bloc/save_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: context.read<SaveBloc>(),
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state is SaveSuccess)
                    Expanded(
                      child: state.dataHistory.isNotEmpty
                          ? ListView.builder(
                              itemCount: state.dataHistory.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  child: Text(state.dataHistory[index]),
                                );
                              })
                          : Container(),
                    ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('back'))
                ],
              ),
            ),
          );
        });
  }
}
