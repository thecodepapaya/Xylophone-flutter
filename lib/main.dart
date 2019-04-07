import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'Xylophone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 AudioPlayer player = AudioPlayer();

  void _sweep() {}

  var _bgColor;

  Widget _imageBuilder(String _imageName,String _audioName){
    return GestureDetector(
      child: Image.asset('assets/$_imageName'),
      onTap: (){
        player.play(_audioName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _bgColor = Colors.blue;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        constraints: BoxConstraints(
          maxHeight: double.infinity,
          maxWidth: double.infinity,
        ),
        color: _bgColor,
        child: GestureDetector(
          // swipe behaviour yet to be defined
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _imageBuilder('1c.png',''),
              Image.asset('assets/2c.png'),
              Image.asset('assets/3c.png'),
              Image.asset('assets/4c.png'),
              Image.asset('assets/5c.png'),
              Image.asset('assets/6c.png'),
              Image.asset('assets/7c.png'),
              Image.asset('assets/8c.png'),
            ],
          ),
        ),
      ),
    );
  }
}
