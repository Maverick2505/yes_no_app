import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/messages.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  // Instancia de la clase Dio para mejorar peticiones HTTP
  final _dio = Dio();
  Future <Message> getAnswer ()async{
    //Almacenar el resultado de la petición
    final response = await _dio.get("https://yesno.wtf/api");

    //almacenar una respuesra
  final yesNoModel = YesNoModel.fromJsonMap(response.data);
  
  //retornar la instalcia de message
  return yesNoModel.toMessageEntity();
  }
}