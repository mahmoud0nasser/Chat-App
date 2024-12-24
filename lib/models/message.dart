import 'package:chat_app_th/constants/constants.dart';

class Message {
  final String message;
  final String id;
  // final String createdAt;

  Message(
    this.message,
    this.id,
    // this.createdAt,
  );
  factory Message.fromJson(jsonData) {
    return Message(
      jsonData[kMessage],
      jsonData['id'],
      // jsonData[kCreatedAt],
    );
  }
}
