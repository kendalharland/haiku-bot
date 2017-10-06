import 'package:discord/discord.dart';
import 'package:haiku_bot/haiku_bot.dart';

class DiscordHaikuBot {
  final HaikuBot _bot = new HaikuBot();

  String handleMessage(Message message) {
    return _bot.handleMessage(
      message.content ?? '',
      message.author.username,
    );
  }
}
