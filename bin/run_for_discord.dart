import 'dart:async';
import 'dart:math' as math;
import 'dart:io';

import 'package:discord/discord.dart' as discord;
import 'package:discord/discord_vm.dart' as discord;
import 'package:haiku_bot/discord/discord_haiku_bot.dart';

Future main() async {
  final apiToken = Platform.environment['DISCORD_API_TOKEN'];
  final haikuBot = new DiscordHaikuBot();
  final random = new math.Random();

  discord.configureDiscordForVM();
  discord.Client bot = new discord.Client(apiToken);

  bot.onReady.listen((discord.ReadyEvent e) {
    print("Ready!");
  });

  bot.onMessage.listen((discord.MessageEvent e) {
    print("GOT: ${e.message.content}");
    final response = haikuBot.handleMessage(e.message);
    if (response.isNotEmpty) {
      if (e.message.channel is discord.TextChannel ||
          e.message.channel is discord.DMChannel ||
          e.message.channel is discord.GroupDMChannel) {
        e.message.channel
            .sendMessage(response, tts: random.nextInt(10000) == 1);
      }
    }
  });
}
