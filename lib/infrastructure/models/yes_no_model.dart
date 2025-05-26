import 'package:yes_no_app/domain/entities/messages.dart';
import 'dart:math';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Message toMessageEntity() {
    // Mapeo ampliado de respuestas con más variedad
    final responseMap = {
      'yes': [
        '¡Sí!',
        'Por supuesto',
        'Claro que sí',
        'Desde luego',
        'Afirmativo',
        'Sin duda',
        'Correcto',
        'Seguro',
        'Así es',
        'Exacto'
      ],
      'no': [
        'No',
        'Para nada',
        'Negativo',
        'En absoluto',
        'Nunca',
        'De ninguna manera',
        'Ni lo sueñes',
        'Jamás',
        'Nop'
      ],
      'maybe': [
        'Quizás',
        'Tal vez',
        'Posiblemente',
        'No estoy seguro',
        'Puede ser',
        'A lo mejor',
        'Tengo mis dudas',
        'No sé',
        'No tengo una respuesta clara'
      ]
    };

    final random = Random();
    String responseText;

    switch (answer.toLowerCase()) {
      case 'yes':
        responseText = responseMap['yes']![random.nextInt(responseMap['yes']!.length)];
        break;
      case 'no':
        responseText = responseMap['no']![random.nextInt(responseMap['no']!.length)];
        break;
      default:
        responseText = responseMap['maybe']![random.nextInt(responseMap['maybe']!.length)];
    }

    return Message(
      text: responseText,
      fromWho: FromWho.him,
      imageUrl: image,
    );
  }
}