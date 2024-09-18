import 'package:exercice_dart/config/theme/appTheme.dart';
import 'package:exercice_dart/presentacion/providers/chat_provider.dart';
import 'package:exercice_dart/presentacion/screen/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
        theme: Apptheme(colorCustom: 1).theme(),
        debugShowCheckedModeBanner: false,
        title: '',
         home: const ChatScreen()
      ),
    );
       
       //Scaffold(
      //   appBar: AppBar(
      //     title: const Text('hola')),

      // body: Center(
      //   child: FilledButton(onPressed: (){}, child: const Text('click me')),
      // ),
      // )
      
    //);
  }
}
