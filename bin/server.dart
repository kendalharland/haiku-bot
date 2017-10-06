import 'dart:io';
import 'run_for_discord.dart' as discord;
import 'run_for_telegram.dart' as telegram;

void main() {
  final chatPlatform = Platform.environment['CHAT_PLATFORM'] ?? 'telegram';
  if (chatPlatform.toLowerCase() == 'discord') {
    discord.main();
  } else {
    telegram.main();
  }
}
