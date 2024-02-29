import 'dart:collection';

class Token {
  String value;
  String type;

  Token(this.value, this.type);

  @override
  String toString() {
    return '$value : $type';
  }
}

class LanguageModel {}

class NLPSystem {
  String text;
  LanguageModel model;

  NLPSystem(this.text, this.model);

  List<Token> tokenize() {
    List<Token> tokens = [];

    List<String> words = text.split(' ');

    for (var word in words) {
      String type = 'word';
      tokens.add(Token(word, type));
    }

    return tokens;
  }

  String parse() {
    return 'Parsing result';
  }
}

void main() {
  String exampleText = 'This is an example sentence.';

  NLPSystem nlpSystem = NLPSystem(exampleText, LanguageModel());

  List<Token> tokens = nlpSystem.tokenize();

  print('Tokens:');
  tokens.forEach((token) {
    print(token);
  });

  String parseResult = nlpSystem.parse();
  print('\nParsing result: $parseResult');
}
