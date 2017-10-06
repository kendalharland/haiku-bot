import 'package:haiku/haiku.dart';

/// A bot that detects and quotes haiku poems.
class HaikuBot {
  static const _formatter = const HaikuFormatter();
  final _composer = new HaikuComposer(syllableCounts: commonMissingWords);

  String handleMessage(String content, String sender) {
    if (_composer.isHaiku(content)) {
      final haiku = _composer.compose(content);
      final formattedHaiku =
          quote(indent(italicise(_formatter.format(haiku)), 2), sender);
      return 'Detected Haiku:\n\n' + formattedHaiku;
    }

    return '';
  }
}

/// Italicises text.
String italicise(String string) => '_${string}_';

/// Indents text.
String indent(String string, int spaceCount) {
  final indent = ' ' * spaceCount;
  return indent + string.replaceAll('\n', '\n' + indent);
}

/// Cites [speaker] as having said [string].
String quote(String string, String speaker) => '${string}\n\n      - $speaker';

/// Words that are missing from the given dictionary.
const commonMissingWords = const <String, int>{
  'noncompetitively': 6,
  'hibiscus': 3,
  'bot': 1,
  'username': 3,
};
