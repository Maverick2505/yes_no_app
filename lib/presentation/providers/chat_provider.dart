import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/messages.dart';

class ChatProvider extends ChangeNotifier {
  //Controlador del scroll
  final ScrollController chatScrollControler = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

   List<Message> messageList = [
    
   ];

   Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    //agregar un nuevo mensaje a la lista
    messageList.add(newMessage);
    print('Cantidad de mensajes: ${messageList.length}');

    //Detectar si el usuario hizo una pregunta
    if(text.endsWith("?")){
      herReply();
    }

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
      curve: Curves.easeOut);
   }
   //Crear respuesta
   Future<void>herReply()async{
    //Obtener el mensaje de la peticion http
    final herMessage = await getYesNoAnswer.getAnswer();

    //Añadimos el mensaje de ella a la lista de mensajes
    messageList.add(herMessage);

    //Notifica a Provider los cambios 
    notifyListeners();

    //Mover el scroll hasta el ultimo mensaje
    moveScrollToBottom();
   }
}