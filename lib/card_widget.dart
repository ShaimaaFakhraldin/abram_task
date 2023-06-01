import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardWidgets extends StatelessWidget {
  String? name;
  String? time;
  String? url;
  String? desc;

  CardWidgets({super.key ,this.name,this.time,this.url, this. desc});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 400,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)),
        elevation: 6,
        child: GridTile(
          // header section
          // ignore: prefer_const_constructors
            header: GridTileBar(
              backgroundColor: Colors.white,
              leading: const CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  'Ya',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              title:  Text(
                name??"",
                style: TextStyle(color: Colors.black),
              ),
              subtitle:  Text(time!,
                style: TextStyle(color: Colors.grey, ),),
            ),


            footer:  Text(desc??"",style: TextStyle(fontSize: 15),),


            child:

            url!=null?
            Image.network(
              url!,
              //fit: BoxFit.cover,
            ):Text("not found image !")),
      ),
    );
  }
}