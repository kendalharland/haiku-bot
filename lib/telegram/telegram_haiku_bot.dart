import 'package:haiku_bot/haiku_bot.dart';
import 'package:telegram_bot/api/api.dart';

class TelegramHaikuBot {
  final HaikuBot _bot = new HaikuBot();

  String handleMessage(Message message) {
    return _bot.handleMessage(
      message.text ?? '',
      '${message.from.firstName} ${message.from.lastName}',
    );
  }
}
