import 'package:exercice_dart/domain/entities/message.dart';
import 'package:flutter/material.dart';

class MyMessage extends StatelessWidget {
 
 final Message message;
 
  const MyMessage({required this.message, super.key});


  @override
  Widget build(BuildContext context) {
  final colors = Theme.of(context).colorScheme;



    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration:  BoxDecoration(
            color : colors.primary,
            borderRadius: BorderRadius.circular(20)
            ),
            child:  Padding(
              padding:  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child:  Text(message.text, style: TextStyle(color: Colors.white),),
            ),
            
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}