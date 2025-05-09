import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "I feel the need",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _IMAGE(),
        const SizedBox(height: 10),

        //Todo: imagen
      ],
    );
  }
}

class _IMAGE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          "https://yesno.wtf/assets/yes/8-2f93962e2ab24427df8589131da01a4d.gif",
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder:(context, child, loadingProgress) {
            
            if (loadingProgress == null) return child;

            return Container(
              width: size.width*0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text("Mav esta enviando mensaje")
            );
          },
        ),
      );
  }
}