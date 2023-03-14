import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:super_mario_64/views/file_select.dart';
import 'package:super_mario_64/views/main_menu.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      initialRoute: "/",
      routes: {
        "/": (context) => const Logo(),
        "/mario_head": (context) => ZoomIn(
            delay: const Duration(seconds: 1),
            duration: const Duration(seconds: 1),
            child: const MainMenu()),
          "/file_select": (context) => FadeIn(
            delay: const Duration(seconds: 1),
            child: const FileSelect()),
      },
    );
  }
}

class Logo extends StatefulWidget {
  const Logo({super.key});

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  Timer timer = Timer(Duration(), () { });
  int time = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logoSound();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
       
        child: Stack(
          children: [
            Container(
              height: mq.height,
              width: mq.width,
              color: Colors.black,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: mq.height * 0.05),
                Center(
                  child: ElasticIn(
                    delay: Duration(seconds: 1),
                    child: SizedBox(
                      height: mq.height * 0.8,
                      width: mq.width * 0.6,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                ),
                Center(
                  child: ZoomIn(
                    delay: Duration(seconds: 2),
                    child: Text("2023, Recreated by Morsa", style: TextStyle(
                      color: Colors.blue[400],
                      fontWeight: FontWeight.bold,
                      fontSize: mq.height * 0.06
                    ),),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
  logoSound(){
    timer = Timer.periodic(const Duration(seconds: 1), (_) { 
      setState(() {
        print(time);
        if (time <= 4) {
          time++;
        }
        if (time == 2) {
          Audio.load('assets/audio/its-me-mario.mp3' )..play()..dispose();
        }
        if (time == 5) {
          timer.cancel();
           Navigator.pushNamed(context, "/mario_head");
        }
      });
    });
  }

}
