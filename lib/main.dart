import 'package:audioplayers/audio_cache.dart';
import "package:audioplayers/audioplayers.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: XylophonePage(),
  ));
  SystemChrome.setEnabledSystemUIOverlays([]);
}

class XylophonePage extends StatefulWidget {
  @override
  _XylophonePageState createState() => _XylophonePageState();
}

class _XylophonePageState extends State<XylophonePage> {
  final _player = AudioCache()
    ..fixedPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

  showSimpleDialog(Color color, int imageNumber) {
    return showDialog<void>(context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          content: Image.asset('images/image$imageNumber.png'),
        );
      },
    );
  }


Widget _createMusicLine({Color color: Colors.red, int number}) =>
    Expanded(
      child: MaterialButton(
        color: color,
        onPressed: () {
          _player.play('note$number.wav');
        },
        onLongPress: () {
          showSimpleDialog(color, number);
        },
      ),
    );

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.black,
    body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _createMusicLine(color: Colors.red, number: 1),
          _createMusicLine(color: Colors.orange, number: 2),
          _createMusicLine(color: Colors.yellow, number: 3),
          _createMusicLine(color: Colors.green, number: 4),
          _createMusicLine(color: Colors.teal, number: 5),
          _createMusicLine(color: Colors.blue, number: 6),
          _createMusicLine(color: Colors.purple, number: 7),
        ],
      ),
    ),
  );
}}
