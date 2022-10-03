abstract class SaveState {}

class SaveInitial extends SaveState {}

class SaveSuccess extends SaveState {
  // final String textData;
  final List<String> dataHistory;
  SaveSuccess({required this.dataHistory});
}
