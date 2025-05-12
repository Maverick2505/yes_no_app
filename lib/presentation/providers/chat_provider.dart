import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/messages.dart';

class ChatProvider extends ChangeNotifier {
  //Controlador del scroll
  final ScrollController chatScrollControler = ScrollController();
   List<Message> messageList = [
    Message(text: "Hola Mike", fromWho: FromWho.him),
    Message(text: "Por haberte ido te vas a especial directo", fromWho: FromWho.me),
    Message(text: "Por haberte ido te vas a especial directo", fromWho: FromWho.me),
    Message(text: "Por haberte ido te vas a especial directo", fromWho: FromWho.me),
    Message(text: "Hola Mike", fromWho: FromWho.him),
   ];

   Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    //agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    print('Cantidad de mensajes: ${messageList.length}');
    //Notifica a provider que algo cambió
    notifyListeners();
    moveScrollToBottom();
   }
   Future<void> moveScrollToBottom() async{
    //animacion
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollControler.animateTo(
      //offset
      chatScrollControler.position.maxScrollExtent , 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
      );
   }
}