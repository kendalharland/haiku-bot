import 'dart:async';
import 'dart:io';

import 'package:haiku_bot/telegram/telegram_haiku_bot.dart';
import 'package:telegram_bot/telegram_bot.dart';

Future main(List<String> args) async {
  final apiToken = Platform.environment['TELEGRAM_API_TOKEN'];
  var tg = new TelegramBot(apiToken);
  var haikuBot = new TelegramHaikuBot();
  var updateOffset = 0;

  new Timer.periodic(const Duration(seconds: 1), (t) async {
    (await tg.getUpdates(offset: updateOffset)).forEach((update) {
      if (update.message == null) {
        updateOffset = update.updateId + 1;
        return;
      }

      final response = haikuBot.handleMessage(update.message);
      if (response.isNotEmpty) {
        tg.sendMessage(update.message.chat.id, response);
      }
      updateOffset = update.updateId + 1;
    });
  });
}
