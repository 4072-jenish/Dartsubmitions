import 'dart:math';

class NaturalLanguageGenerationSystem {
  List<String> _templates;
  Map<String, List<String>> _rules;

  NaturalLanguageGenerationSystem(this._templates, this._rules);

  
  String generate(String templateName) {
    if (!_templates.contains(templateName)) {
      throw ArgumentError('Template $templateName not found');
    }

    String template = _pickRandomTemplate(templateName);
    return _render(template);
  }

  /
  String _pickRandomTemplate(String templateName) {
    List<String> options = _rules[templateName];
    int randomIndex = Random().nextInt(options.length);
    return options[randomIndex];
  }

  /
  String _render(String template) {
    return template.replaceAllMapped(RegExp(r'{(.*?)}'), (match) {
      String placeholder = match.group(1);
      
      return placeholder;
    });
  }
}

void main() {
 
  List<String> templates = [
    'greeting',
    'farewell',
  ];

  Map<String, List<String>> rules = {
    'greeting': ['Hello {name}!', 'Hi {name}, nice to meet you.'],
    'farewell': ['Goodbye {name}.', 'See you later, {name}!']
  };

 
  var nlg = NaturalLanguageGenerationSystem(templates, rules);

  print(nlg.generate('greeting')); 
  print(nlg.generate('farewell')); 
}
