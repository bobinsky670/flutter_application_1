import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "te quiero",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "https://www.google.com/url?sa=i&url=https%3A%2F%2Fgifer.com%2Fes&psig=AOvVaw2-Yl6pG_xWfUh_l6tbYqhc&ust=1743739896384000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCLjMwbr_uowDFQAAAAAdAAAAABAm",
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child; 

          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 5),
            child: const Text("mi amor esta enviando una imagen"),
          );
        },
      ),
    );
  }
}
