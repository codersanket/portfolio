import 'package:flutter/material.dart';
import 'package:portfolio/costants.dart';
import 'package:velocity_x/velocity_x.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with SingleTickerProviderStateMixin{



@override
  void initState() {
   
    super.initState();

    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(20) ,
      color: secondaryColor,
      child: Row(
        children: [image(),
        about()
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
      ),
    );
  }

  // Color color = primaryColor;
 Widget about(){
   return Container(
     child: Column(
       children:[
         Chip(
           backgroundColor: primaryColor,
           padding: EdgeInsets.all(10),
           label:Text("About Me",style:TextStyle(color: secondaryColor))
         ),
         Text("I'm Here with 2 years of user \nexperince",style:TextStyle(
           color:backGroundColor,
           fontWeight: FontWeight.bold
           ,fontSize:50 
         )),
         SizedBox(
           height: 30,
         ),
         Text("I prevent your loss of time and indecision in the works I have taken and the \nprojects I have done and offer the best solution. Many of my customers and \nbrands express their satisfaction with working with me.We can appeal to a huge \naudience and grow your business.",
         
         style: TextStyle(
           color:Color(0xff6D7077),
           fontSize:18
         ),
         ),
         Row(
          children:[
            Column(children: [
                SizedBox(height:20),
              "Name:".text.bold.start.size(20).make(),
              SizedBox(height:20),
              "Sanket Babar".text.size(18).start.color(Color(0xff6D7077)).make(),
              SizedBox(height:20),
                "Country:".text.bold.start.size(20).make(),
                SizedBox(height:20),
              "India".text.size(20).start.color(Color(0xff6D7077)).make(),
              SizedBox(height:20),
                "Freelance:".text.bold.start.size(20).make(),
                SizedBox(height:20),
              "Available".text.size(20).start.color(Color(0xff6D7077)).make()
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
           
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.15,
            ),
            Column(children:[
               SizedBox(height:20),
              "Universtiy:".text.bold.start.size(20).make(),
              SizedBox(height:20),
              "DIEMS".text.size(18).start.color(Color(0xff6D7077)).make(),
              SizedBox(height:20),
                "Languages:".text.bold.start.size(20).make(),
                SizedBox(height:20),
              "Marathi,English,Hindi".text.size(20).start.color(Color(0xff6D7077)).make(),
              SizedBox(height:20),
                "Address:".text.bold.start.size(20).make(),
                SizedBox(height:20),
              "Solpaur".text.size(20).start.color(Color(0xff6D7077)).make()
            ],

             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,),
           
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
         ),

       ],
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.start,
     ),
     
   );
 }

  Color color=primaryColor;

  Widget image() {
    return Container(
      child: InkWell(
        onTap: () {},
        onHover: (val) {
          
          setState(() {
            
         
            if (val == true) {
             color=backGroundColor;
            } else {
            color=primaryColor;
            }
             });
        
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.35,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                 top: MediaQuery.of(context).size.height*0.30,
                  height: MediaQuery.of(context).size.height*0.2,
                  width: MediaQuery.of(context).size.height*0.2,
                              child: Container(
                  decoration:BoxDecoration(
                    border:Border.all(color:color,width: 3),
                    shape:BoxShape.circle,

                  ),
                  child:Container(
                    margin: EdgeInsets.all(10),
                     decoration:BoxDecoration(
                    border:Border.all(color:color,width: 3),
                    shape:BoxShape.circle,

                  ),

                  )
                ),
              ),
              AnimatedContainer(
                 duration: Duration(milliseconds:500),
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.3,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(50)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/profile2.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              Positioned(

              right: 45,
              top: MediaQuery.of(context).size.height*0.35,
              
                    child: AnimatedContainer(
                      duration: Duration(milliseconds:500),
                      
                    height: 80,
                    width: 80,
                  decoration:BoxDecoration(
                    shape:BoxShape.circle,
                    color:color,

                  ),
                  child: Icon(Icons.play_arrow,color: secondaryColor,size: 50,),
                ),
              ),
              // Positioned(
              //   right: 0,
              //    top: MediaQuery.of(context).size.height*0.35,
              //     height: MediaQuery.of(context).size.height*0.2,
              //     width: MediaQuery.of(context).size.height*0.2,
              //                 child: Container(
              //     decoration:BoxDecoration(
              //       border:Border.all(color:primaryColor,width: 2),
              //       shape:BoxShape.circle,

              //     ),
              //     child:Container(
              //       margin: EdgeInsets.all(10),
              //        decoration:BoxDecoration(
              //       border:Border.all(color:primaryColor,width: 2),
              //       shape:BoxShape.circle,

              //     ),

              //     )
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
