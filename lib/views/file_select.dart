import 'package:audiofileplayer/audiofileplayer.dart';
import 'package:flutter/material.dart';

class FileSelect extends StatefulWidget {
  const FileSelect({super.key});

  @override
  State<FileSelect> createState() => _FileSelectState();
}

class _FileSelectState extends State<FileSelect> {
  final theme = Audio.load('assets/audio/file-select.mp3');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theme..play()..dispose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    theme..pause()..dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/bgSelect.png",
            height: mq.height,
            width: mq.width,
            fit: BoxFit.fill,
          ),

          //del titulo hasta botones de colores
          Column(
            children: [
              //SELECT FILE
              SizedBox(
                height: mq.height * 0.17,
              ),
              Image.asset(
                "assets/images/select-file.png",
                height: mq.height * 0.1,
                width: mq.width * 0.3,
                fit: BoxFit.fill,
              ),

              //SELECTOR DE ARCHIVOS
              Container(
                  padding: EdgeInsets.only(
                    left: mq.width * 0.25,
                    right: mq.width * 0.25,
                  ),
                  height: mq.height * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ficheros(mq, " MARIO A"),
                      ficheros(mq, " MARIO B")
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ficheros(mq, " MARIO C"),
                      ficheros(mq, " MARIO D")
                    ],
                  )
                    ],
                  )),

              //BLOQUES  COLORES
              Padding(
                padding: EdgeInsets.only(
                  left: mq.width * 0.2,
                  right: mq.width * 0.2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    bloques(mq, "blockGreen", "SCORE"),
                    bloques(mq, "blockBlue", "COPY"),
                    bloques(mq, "blockRed", "ERASE"),
                    bloques(mq, "blockPurple", "STEREO"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bloques(mq, bloque, titulo) {
    return Column(
      children: [
        Image.asset(
          "assets/images/${bloque}.png",
          height: mq.height * 0.10,
          width: mq.width * 0.10,
          fit: BoxFit.fill,
        ),
        Text(
          titulo,
          style: TextStyle(
              shadows: const [Shadow(color: Colors.black, blurRadius: 10.0)],
              fontSize: mq.height * 0.05,
              fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  ficheros(mq, titulo) {
    return SizedBox(
      height: 50,
      width: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/iconHead.png",
            height: mq.height * 0.12,
            width: mq.width * 0.10,
            fit: BoxFit.fill,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                titulo,
                style: TextStyle(
                    shadows: const [Shadow(color: Colors.black, blurRadius: 10.0)],
                    fontSize: mq.height * 0.05,
                    fontStyle: FontStyle.italic),
              ),
              Image.asset(
                "assets/images/new.png",
                height: mq.height * 0.06,
                width: mq.width * 0.1,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
