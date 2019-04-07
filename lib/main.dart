import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:splashscreen/splashscreen.dart';

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
      home: LoadingScreen(),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 2,
      backgroundColor: Colors.white,
      imageBackground: AssetImage("assets/bg.jpg"),
      styleTextUnderTheLoader: TextStyle(
        fontSize: 25,
      ),
      image: Image.asset(
        "assets/icon.png",
        scale: 0.5,
      ),
      loaderColor: Colors.blue,
      navigateAfterSeconds: new HomeScreen(),
      loadingText: Text("Hang On! We are tuning some bits"),
      title: Text(
        "Xylophone",
        softWrap: true,
        textAlign: TextAlign.center,
        textScaleFactor: 3,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AudioCache player = AudioCache();

  @override
  void initState() {
    super.initState();
    player.loadAll([
      'sounds/a.wav',
      'sounds/b.wav',
      'sounds/c.wav',
      'sounds/c2.wav',
      'sounds/d1.wav',
      'sounds/e1.wav',
      'sounds/f.wav',
      'sounds/g.wav',
      'sounds/sweep.wav'
    ]);
    player.play('sounds/sweep.wav');
  }

  var _bgColor = Color.fromRGBO(250, 250, 250, 0);

  Widget _imageBuilder(
      String _imageName, String _audioName, int r, int g, int b) {
    return GestureDetector(
      child: Image.asset(
        'assets/images/$_imageName',
      ),
      onPanStart: (_) {
        player.play('sounds/sweep.wav');
      },
      onTap: () {
        player.play('sounds/$_audioName');
        print("Played: $_audioName");
        setState(() {
          _bgColor = Color.fromRGBO(r, g, b, 0.8);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        padding: EdgeInsets.all(20),
        constraints: BoxConstraints(
          maxHeight: double.infinity,
          maxWidth: double.infinity,
        ),
        color: _bgColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _imageBuilder('1c.png', 'c.wav', 2, 67, 128),
            _imageBuilder('2c.png', 'd1.wav', 250, 2, 2),
            _imageBuilder('3c.png', 'e1.wav', 1, 1, 183),
            _imageBuilder('4c.png', 'f.wav', 1, 176, 0),
            _imageBuilder('5c.png', 'g.wav', 127, 127, 1),
            _imageBuilder('6c.png', 'a.wav', 247, 215, 34),
            _imageBuilder('7c.png', 'b.wav', 0, 94, 198),
            _imageBuilder('8c.png', 'c2.wav', 244, 209, 10),
          ],
        ),
      ),
    );
  }
}
