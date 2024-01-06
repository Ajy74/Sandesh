import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:sandesh/screens/camera_view_screen.dart';
import 'package:sandesh/screens/vedio_view_screen.dart';
import 'package:sandesh/utils/color.dart';

List<CameraDescription>? cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  CameraController? _cameraController;
  Future<void>? cameraValue;
  String videoPath = "";
  bool isRecording = false;
  bool isFlash = false;
  bool isFlip = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras![0], ResolutionPreset.high);
    cameraValue = _cameraController!.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            FutureBuilder(
              future: cameraValue, 
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  return Expanded(child: CameraPreview(_cameraController!));
                }
            
                return const Center(
                  child:  CircularProgressIndicator(color: primary,),
                );
              }
            ),
        
            Positioned(
              bottom: 0.0,
              child: Container(
                color: Colors.black,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: (){
                            setState(() {
                              isFlash = !isFlash;
                            });

                            isFlash ? _cameraController!.setFlashMode(FlashMode.torch) :  _cameraController!.setFlashMode(FlashMode.off);
                          }, 
                          icon: Icon(
                            !isFlash ? Icons.flash_off : Icons.flash_on_rounded,
                            color: Colors.white,size: 28,
                          )
                        ),
                        GestureDetector(
                          onTap: (){takePicture(context);},
                          onLongPress: (){
                            createVedio(context);
                          },
                          onLongPressUp: () async{
                            XFile vedioData = await _cameraController!.stopVideoRecording();

                            setState(() {
                              isRecording = false;
                            });

                            Navigator.push(context, MaterialPageRoute(builder: (builder)=> VedioViewScreen(path: vedioData.path,)));
                          },
                          child: isRecording
                            ? Icon(
                                Icons.radio_button_on,
                                color: Colors.red,
                                size: 70,
                              )
                            : Icon(
                                Icons.panorama_fish_eye,
                                color: Colors.white,
                                size: 70,
                              ),
                        ),
                        // IconButton(
                        //   onPressed: (){
                        //     if(!isRecording){
                        //       takePicture(context);
                        //     }
                        //   }, 
                        //   icon: const Icon(Icons.panorama_fish_eye,color: Colors.white,size: 70,)
                        // ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isFlip = !isFlip;
                            });

                            int camPos = isFlip ? 1 : 0;
                            _cameraController = CameraController(
                              cameras![camPos], 
                              ResolutionPreset.high
                            );
                            cameraValue = _cameraController!.initialize();
                           
                            // isFlip ? _cameraController = CameraController(cameras![1], ResolutionPreset.high) :  _cameraController = CameraController(cameras![0], ResolutionPreset.high);
                          }, 
                          icon: Transform.flip(
                            flipY: isFlip,
                            child: const Icon(
                              Icons.flip_camera_ios,
                              color: Colors.white,
                              size: 28,
                            ),
                          )
                        ),
                      ],
                    ),
                    const SizedBox(height: 3,),
                    const Text(
                      "Hold for Vedio, tap for photo",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                     const SizedBox(height: 12,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  
  void createVedio(BuildContext context) async{
    setState(() {
      isRecording = true;
    });
    // final path = join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");
    await _cameraController!.startVideoRecording();

    // print(path);

    // Navigator.push(context, MaterialPageRoute(builder: (builder)=> CameraViewScreen(path: imageData.path,)));
  }
  
  void takePicture(BuildContext context) async{
    // final path = join((await getTemporaryDirectory()).path, "${DateTime.now()}.mp4");
    XFile imageData = await _cameraController!.takePicture();

    print(imageData.path);
    
    Navigator.push(context, MaterialPageRoute(builder: (builder)=> CameraViewScreen(path: imageData.path,)));
  }
}