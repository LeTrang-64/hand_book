import 'package:pigeon/pigeon.dart';

class Message {
  String? text;
}

@HostApi()
abstract class Api {
  Message getMessage();
  void sendMessage(Message message);
}
