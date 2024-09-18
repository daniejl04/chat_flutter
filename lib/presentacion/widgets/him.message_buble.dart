import 'package:exercice_dart/domain/entities/message.dart';
import 'package:flutter/material.dart';

class HimMessage extends StatelessWidget {

  final Message message;

  const HimMessage(
    {super.key,
    required this.message
  });

  @override
  Widget build(BuildContext context) {
  final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration:  BoxDecoration(
            color : colors.secondary,
            borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(
              message.text,
              style: TextStyle(color: Colors.white),),
            ),
            
        ),
        const SizedBox(height: 5),
        _MyImage(message.imageUrl!) // Replace with your actual image widget
      ],
    );
  }
}

class _MyImage extends StatelessWidget {
 
  final String imageUrl;

 const _MyImage(
       this.imageUrl
    );

  @override
  Widget build(BuildContext context) {


    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius : BorderRadius.circular(20),
      child: Image.network(
          imageUrl,
          width : size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder:(context, child, loadingProgress) {
            if(loadingProgress == null) return child;

            return Container(
              width : size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text('Loading...'),
        
            );
          },
 
        ),
      );
      
  }
}