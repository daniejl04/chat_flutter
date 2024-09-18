import 'package:exercice_dart/domain/entities/message.dart';
import 'package:exercice_dart/presentacion/providers/chat_provider.dart';
import 'package:exercice_dart/presentacion/widgets/him.message_buble.dart';
import 'package:exercice_dart/presentacion/widgets/message_fiel_box.dart';
import 'package:exercice_dart/presentacion/widgets/my_message_double.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(backgroundImage: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/a/a0/John_Rambo.jpg'),),
        ),
        title: const Text('chat'),
        centerTitle: false,
      ),
      body: _ChatView()
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

   final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length, // entrada a la lista que se encuantra en la clase porvider del chat
                itemBuilder: (context, index) {
               final message = chatProvider.messageList[index];

               return (message.fromWho == FromWho.him)
               ? HimMessage(message : message)
               : MyMessage(message : message);
                },
              ),
            ),
            MessageFielBox(
             // onValue:(value) => chatProvider.sendMessage(value),  ejecutan los mismo 
              onValue: chatProvider.sendMessage /// opcion si el parametro es igual a lo que se resive y se envia
              ),
            
            
          ],
        ),
      ),
    );
  }
}