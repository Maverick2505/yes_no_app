import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/messages.dart';

class ChatProvider extends ChangeNotifier {
   List<Message> messageList = [
    Message(text: "Hola Mike", fromWho: FromWho.him),
    Message(text: "Por haberte ido te vas a especial directo", fromWho: FromWho.me),
    Message(text: "Por haberte ido te vas a especial directo", fromWho: FromWho.me),
    Message(text: "Por haberte ido te vas a especial directo", fromWho: FromWho.me),
   ];

   Future<void> sendMessage(String text) async {
    final newMessage = Message(text: text, fromWho: FromWho.me);
    //agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    //Notifica a provider que algo cambió
    notifyListeners();
   }
}