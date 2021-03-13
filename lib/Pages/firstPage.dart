import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/costants.dart';
import 'package:velocity_x/velocity_x.dart';

class firstPage extends StatefulWidget {
  final PageController pageController;

  const firstPage({Key key, this.pageController}) : super(key: key);
  @override
  _firstPageState createState() => _firstPageState();
}

class _firstPageState extends State<firstPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    widget.pageController.addListener(() {});

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..forward();

    animation = Tween<Offset>(end: Offset(0.0, 0.0), begin: Offset(0, 0.1))
        .animate(CurvedAnimation(parent: controller, curve: Curves.linear));
  }

  bool color=false;
  bool email=false;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: backGroundColor,
        child: SlideTransition(
          position: animation,
          child: Stack(
            children: [
              Container(
                  child: Row(
                children: [description(), image()],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
              ),),
              Positioned(
                left: 20,
                bottom: 10,
                child: Column(
                  children:[
                    RotatedBox(quarterTurns: 1,
                    child: InkWell(
                      onTap: (){
                        widget.pageController.nextPage(duration: Duration(milliseconds:500), curve: Curves.easeIn);
                      },
                      onHover: (val){
                        setState(() {
                         color=val;
                        });
                      },
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds:500),
                        
                          curve: Curves.linear,
                        style:color?TextStyle(color: primaryColor):TextStyle(color: secondaryColor),
                        child: "Scroll Down".text.make())),
                      
                    ),
                    (10).heightBox,
                    Container(
                      color: secondaryColor,
                      height: 20,
                      width:2,
                    ),

                  ]
                )),
                Positioned(
                  right: 20,
                  bottom: 10,

                  child:Column(
                    children: [
                      FaIcon(FontAwesomeIcons.github,color:secondaryColor,),
                      (10).heightBox,
                      FaIcon(FontAwesomeIcons.instagram,color:secondaryColor,),
                      (10).heightBox,
                      RotatedBox(quarterTurns: 1,
                    child: InkWell(
                      onTap: (){
                        widget.pageController.nextPage(duration: Duration(milliseconds:500), curve: Curves.easeIn);
                      },
                      onHover: (val){
                        setState(() {
                         email=val;
                        });
                      },
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds:500),
                        
                          curve: Curves.linear,
                        style:email?TextStyle(color: primaryColor):TextStyle(color: secondaryColor),
                        child: "babarsanket031@gmail.com".text.make())),
                      
                    ),
                      
                    ],
                  )
                )
            ],
          ),
        ));
  }

  var firstColor = primaryColor;
  var secondColor = secondaryColor;

  

  Widget description() {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Text(
            "I'm\nSanket Babar",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: secondaryColor,
                fontSize:70),
          ),
        ),
        SizedBox(height: 30),
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          child: Center(
            child: Text(
              "Always new beginnings can move the business forward.A user experince is required before services.Now is great opprtunity to work with me and move your brand forward",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: secondaryColor,
                  fontSize:22),
            ),
          ),
        ),
        SizedBox(height: 30),
        Container(
          width: MediaQuery.of(context).size.width * 0.12,
          child: InkWell(
            splashColor: secondaryColor,
            onHover: (c) {
              setState(() {
                if (c == true)
                  setState(() {
                    firstColor = secondaryColor;
                    secondColor = primaryColor;
                  });
                if (c == false)
                  setState(() {
                    firstColor = primaryColor;
                    secondColor = secondaryColor;
                  });
              });
            },
            onTap: () {
              widget.pageController.animateToPage(2,
                  duration: Duration(seconds: 1), curve: Curves.easeIn);
            },
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: MediaQuery.of(context).size.width * 0.1,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor,
                      blurRadius: 1.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                  color: firstColor,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "VIEW WORKS",
                      style: TextStyle(
                          color: secondColor,
                          fontSize: MediaQuery.of(context).size.width * 0.01),
                    ),
                  ),
                  Expanded(child: Container()),
                  AnimatedContainer(
                      duration: Duration(milliseconds: 700),
                      height: MediaQuery.of(context).size.width * 0.035,
                      width: MediaQuery.of(context).size.width * 0.035,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: secondColor, width: 2)),
                      child: AnimatedContainer(
                          duration: Duration(milliseconds: 700),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: secondColor,
                            border: Border.all(color: secondColor, width: 2)),
                        child: Icon(
                          Icons.arrow_forward_sharp,
                          color: firstColor,
                          size:30,
                        ),
                      ))
                ]),
              ),
            ),
          ),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Widget image() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: secondaryColor, width: 4)),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: secondaryColor, width: 4)),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: primaryColor,
            shape: BoxShape.circle,
            //border: Border.all(color: secondaryColor, width: 4)
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.height * 0.3,
            child: ClipOval(
                child: Image.asset(
              "assets/profile.jpeg",
              fit: BoxFit.cover,
            )),
          ),
        ),
      ),
    );
  }
}
