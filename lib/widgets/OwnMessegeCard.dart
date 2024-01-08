import 'package:flutter/material.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45
        ),
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topLeft: Radius.elliptical(25, 20),
            topRight: Radius.elliptical(35, 30),
            // topRight: Radius.circular(18),
            // bottomLeft: Radius.circular(18),
            bottomLeft: Radius.elliptical(35, 30),
            // bottomRight: Radius.elliptical(35, 30),
          )),
          color: const Color(0xFFdcf8c6),
          child: Stack(
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 10,right: 60,top: 5,bottom: 20),
                child: Text(
                  "Hey how are you ? sckeobvwboub  qjx ",
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
              ),

              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      "20:58",
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey
                      ),
                    ),
                    const SizedBox(width: 4,),
                    Icon(Icons.done_all,size: 18,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}