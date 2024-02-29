import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chat App'),
        ),
        body: ChatWidget(),
      ),
    );
  }
}

class ChatWidget extends StatefulWidget {
  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final ChatApp _chatApp = ChatApp();

  final TextEditingController _textController = TextEditingController();

  void _sendMessage() {
    if (_textController.text.isNotEmpty) {
      final String id = DateTime.now().toString();
      final User sender = User('1', 'User 1');
      final String text = _textController.text;
      final DateTime timestamp = DateTime.now();

      final Message message = Message(id, sender, text, timestamp);

      _chatApp.sendMessage(message);

      _textController.clear();
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _chatApp.messages.length,
            itemBuilder: (context, index) {
              final Message message = _chatApp.messages[index];
              return ListTile(
                title: Text(message.sender.name),
                subtitle: Text(message.text),
                leading: CircleAvatar(
                  child: Text(message.sender.id.substring(0, 1)),
                ),
              );
            },
          ),
        ),
      ]
    ),
  }
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textController,
                  decoration: InputDecoration(hintText: 'Type a message'),
                ),
              ),
            ]
          )
        )
              IconButton(
                icon: Icon(Icons.send),
                onPressed: _sendMessage,
              )