import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  var theme = Audio.load('assets/audio/title-theme.mp3');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    theme
      .play()
;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    theme.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bg.jpg",
            height: mq.height,
            width: mq.width,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: mq.height * 0.1),
              Center(
                child: SizedBox(
                  height: mq.height * 0.8,
                  width: mq.width * 0.5,
                  child: ElasticIn(
                    delay: const Duration(seconds: 2),
                    child: ModelViewer(
                      autoPlay: true,
                      backgroundColor: Colors.transparent,
                      loading: Loading.lazy,
                      autoRotate: true,
                      disableZoom: true,
                      src: "assets/obj/mario_head2.glb",
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: mq.height * 0.01,
            child: GestureDetector(
              onTap: (){
                print("hola");
                theme..pause()..dispose();
                Navigator.pushNamedAndRemoveUntil(context, "/file_select", (route) => true);
              },
              child: Container(
                height: mq.height * 0.25,
                width: mq.width * 0.25,
                child: Flash(
                  infinite: true,
                  duration: const Duration(seconds: 4),
                  child: Image.asset("assets/images/pressStart.png"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
