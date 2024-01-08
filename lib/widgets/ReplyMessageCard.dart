import 'package:flutter/material.dart';

class ReplyMessageCard extends StatelessWidget {
  const ReplyMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45
        ),
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            // topLeft: Radius.elliptical(-10, 30),
            topRight: Radius.elliptical(35, 30),
            // topRight: Radius.circular(18),
            // bottomLeft: Radius.circular(18),
            bottomLeft: Radius.elliptical(35, 30),
            bottomRight: Radius.circular(18)
          )),
          // color: const Color(0xFFdcf8c6),
          child: Stack(
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 10,right: 60,top: 5,bottom: 20),
                child: Text(
                  "Hey",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              ),

              Positioned(
                bottom: 4,
                right: 10,
                child: Text(
                  "20:58",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}