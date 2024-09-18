import 'package:flutter/material.dart';

class MessageFielBox extends StatelessWidget {
  
  final ValueChanged<String> onValue;

  const MessageFielBox({
    super.key,
    required this.onValue
    });


  @override
  Widget build(BuildContext context) {


  final textController = TextEditingController();
  final focusNode = FocusNode();

    final inputBorder =  OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(color: Colors.transparent)
    );

    return  TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      },
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: true,
        hintText: 'Type a message',
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send), 
          onPressed: (){
            final textValue = textController.value.text;
            textController.clear();
            onValue(textValue);

          },
          )
      ),
      controller: textController,
      onFieldSubmitted: (value){
      onValue(value);
      textController.clear();
      },
    );
  }
}