import 'package:audioplayers/audio_cache.dart';
import "package:audioplayers/audioplayers.dart";
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: XylophonePage(),
    ));

class XylophonePage extends StatelessWidget {
  final _player = AudioCache()
    ..fixedPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

  Widget _createMusicLine({Color color: Colors.red, int soundNumber}) =>
      Expanded(
        child: MaterialButton(
            color: color,
            onPressed: () {
              _player.play('note$soundNumber.wav');
            }),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _createMusicLine(color: Colors.red, soundNumber: 1),
            _createMusicLine(color: Colors.orange, soundNumber: 2),
            _createMusicLine(color: Colors.yellow, soundNumber: 3),
            _createMusicLine(color: Colors.green, soundNumber: 4),
            _createMusicLine(color: Colors.teal, soundNumber: 5),
            _createMusicLine(color: Colors.blue, soundNumber: 6),
            _createMusicLine(color: Colors.purple, soundNumber: 7),
          ],
        ),
      ),
    );
  }
}
