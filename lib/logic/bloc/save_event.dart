abstract class SaveEvent {}

class SaveData extends SaveEvent {
  final String textData;

  SaveData({
    required this.textData,
  });
}
