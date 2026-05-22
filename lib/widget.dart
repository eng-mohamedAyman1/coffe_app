import 'package:flutter/material.dart';

class Drink extends StatelessWidget {
  String image;
  String name;
  String title;
   Drink({super.key, required this.image,
     required this.name,
     required this.title,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
            color: Colors.white,
            elevation: 3,

            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(
                vertical: 60,
                horizontal: 30,
              ),
              child: Row(),
            ),
          ),
        ),
        Positioned(
          top: -10,
          bottom: 39,
          left: 10,
          child: Stack(
            alignment: AlignmentGeometry.bottomCenter,
            children: [
              Container(
                width: 70,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade900,
                      blurRadius: 30,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              Image.asset(
               image,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        Positioned(
          top: 40,
          left: 100,
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(title,style: TextStyle(color: Colors.black45),),
            ],
          ),
        ),
        Positioned(
          right: 40,
          bottom: 30,
          child: Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                shape: BoxShape.circle,

                border: Border.all(color: Colors.black54)
            ),
            child: Icon(Icons.arrow_forward, color: Colors.black26,size: 19,),
          ),
        ),
      ],
    );
  }
}
