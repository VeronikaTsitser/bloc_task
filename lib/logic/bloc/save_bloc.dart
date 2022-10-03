import 'package:bloc_task/logic/bloc/save_event.dart';
import 'package:bloc_task/logic/bloc/save_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  SaveBloc() : super(SaveInitial()) {
    on<SaveData>((event, emit) {
      final textData = event.textData;
      List<String> newHistory = [];
      if (state is SaveSuccess) {
        newHistory = (state as SaveSuccess).dataHistory;
      }
      newHistory.add(textData);
      emit(
        SaveSuccess(dataHistory: newHistory),
      );
    });
  }
}
