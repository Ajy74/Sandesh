import 'dart:io';

import 'package:flutter/material.dart';

class CameraViewScreen extends StatelessWidget {
  CameraViewScreen({super.key, required this.path});

  String path;

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
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
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
          ],
        ),
      ),
    );
  }
}