import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VedioViewScreen extends StatefulWidget {
  VedioViewScreen({super.key, required this.path});

  String path;

  @override
  State<VedioViewScreen> createState() => _VedioViewScreenState();
}

class _VedioViewScreenState extends State<VedioViewScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.file(File(widget.path))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: (){
              
            }, 
            icon: const Icon(Icons.crop_rotate,color: Colors.white,size: 27,)
          ),
          IconButton(
            onPressed: (){
              
            }, 
            icon: const Icon(Icons.emoji_emotions_outlined,color: Colors.white,size: 27,)
          ),
          IconButton(
            onPressed: (){
              
            }, 
            icon: const Icon(Icons.title,color: Colors.white,size: 27,)
          ),
          IconButton(
            onPressed: (){
              
            }, 
            icon: const Icon(Icons.edit,color: Colors.white,size: 27,)
          ),
        ],
      ),

      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height -150,
              child: Center(
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
              ),
            ),

            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.black38,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                child: TextFormField(
                  style:const TextStyle(
                      color: Colors.white,
                      fontSize: 17
                  ),
                  maxLines: 6,
                  minLines: 1,
                  decoration: const InputDecoration(
                    hintText: "Add Caption...",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.add_photo_alternate,color: Colors.white,size: 27,),
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 17
                    ),
                    suffixIcon: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.teal,
                      child: Icon(Icons.check,color: Colors.white,size: 27,),
                    ),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){
                  setState(() {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  });
                },
                child: CircleAvatar(
                  radius: 33,
                  backgroundColor: Colors.black38,
                  child: Icon(
                    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,size: 50,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

}