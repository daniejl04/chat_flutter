import 'package:flutter/material.dart';

const _colorCustoms = Color.fromARGB(226, 240, 6, 6);


const List<Color> _colorThemes = [
 _colorCustoms,
 Colors.blue,
 Colors.green,
 Colors.yellow,
 Colors.red,
 Colors.pink,
 Colors.purple,
];

class Apptheme {

final int colorCustom;

  Apptheme({
    this.colorCustom = 0
  }):assert(colorCustom >= 0 && colorCustom <= _colorThemes.length - 1, 'colorCustom must be');

ThemeData theme(){
  return ThemeData(
    useMaterial3: true,
    colorSchemeSeed: _colorThemes[colorCustom]
  );
}

}