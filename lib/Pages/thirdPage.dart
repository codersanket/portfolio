import 'dart:html';

import 'package:flutter/material.dart';
import 'package:portfolio/Widgets/cards.dart';
import 'package:portfolio/costants.dart';
import 'package:velocity_x/velocity_x.dart';

class ThirdPage extends StatefulWidget  {
  final PageController pageController;

  const ThirdPage({Key key, @required this.pageController}) : super(key: key);
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>  with SingleTickerProviderStateMixin{


  

  @override
  void initState() {
   super.initState();

   

  
   
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: thirdColor,
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 200,vertical: 50),
        child: Column(
          children:[
            Chip(
             backgroundColor: primaryColor,
             padding: EdgeInsets.all(10),
             label:Text("Resume",style:TextStyle(color: secondaryColor))
           ),
           
           "My Resume".text.color(Colors.black).bold.size(40).make(),
           SizedBox(height:10),
          Row(
            children:[
              Container(
                color:primaryColor,
                height:3,
                width:20
              ),
              SizedBox(width:5),
              Container(
                color:primaryColor,
                height:3,
                width:40
              ),
            ]
          ),
          SizedBox(height:20),
          Row(
              children:[
                 cards(
            iconData: Icons.home,
            companyName: "Google LLC",
            role: "Web Designer",
            year: "2018-2019",
        ),
         cards(
            iconData: Icons.home,
            companyName: "Google LLC",
            role: "Web Designer",
            year: "2018-2019",
        ),
        
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          SizedBox(height:20),
                    Row(
            children:[
               cards(
          iconData: Icons.home,
          companyName: "Google LLC",
          role: "Web Designer",
          year: "2018-2019",
        ),
         cards(
          iconData: Icons.home,
          companyName: "Google LLC",
          role: "Web Designer",
          year: "2018-2019",
        ),
        
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
         
                  
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
        
          
        ),
      ),
    );
  }


  
}



