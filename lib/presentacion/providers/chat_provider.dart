
import 'package:exercice_dart/config/helpers/get_yes_no.dart';
import 'package:exercice_dart/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();
  final getYesNo = GetYesNo();

  List<Message> messageList = [
   Message(text: 'hello you to', fromWho: FromWho.me),
   Message(text: 'how are you?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty)return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
       if(text.endsWith('?')){
      himResponse();
    }
    notifyListeners(); 
    moveScrollBottom();

  }

  Future<void> himResponse() async{
    final himMessage = await getYesNo.getAnswer();
    messageList.add(himMessage);
    notifyListeners();
    moveScrollBottom();
  }

  void moveScrollBottom (){
    chatScrollController.animateTo(
    chatScrollController.position.maxScrollExtent,
    duration: Durations.medium2,
    curve: Curves.decelerate);
  }
}