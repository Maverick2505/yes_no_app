import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/messages.dart';

class MyMessageBubble extends StatelessWidget {
  //Variable de la identidad atomica Message
  final Message message;
  DateTime ahora = DateTime.now();
  MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    Text(
                      message.text,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text("Enviado: ${ahora.hour}:${ahora.minute}")
                  ],
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.done_all,
                  color: Colors.white,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}