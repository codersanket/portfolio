import 'package:flutter/material.dart';
import 'package:portfolio/costants.dart';
import 'package:velocity_x/velocity_x.dart';
class cards extends StatefulWidget {
  final IconData iconData;
final  String companyName;
 final String role;
 final String year;

  const cards({Key key, this.iconData, this.companyName, this.role, this.year}) : super(key: key);
  @override
  _cardsState createState() => _cardsState();
}

class _cardsState extends State<cards> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  Animation animation;
  @override
  void initState() {
  super.initState();

  animationController=AnimationController(
    vsync: this,duration: Duration(milliseconds:500)
  );

  animation=Tween<Offset>(
    begin: Offset(0.0,0.05),
    end: Offset(0.0,0.0)
  ).animate(CurvedAnimation(curve: Curves.decelerate,parent: animationController));

  }
  
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
          position: animation,
          child: InkWell(
            onTap: (){},
            onHover: (val){
              if(val==true){
                  animationController..forward();
              }else{
                animationController..reverse();
              }
            },
                      child: Container(
        height: MediaQuery.of(context).size.width*0.1,
        width: MediaQuery.of(context).size.width*0.35,
        decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color:Color(0xffFFE2D6),
                blurRadius:10,
                spreadRadius:1,

              ),
              // BoxShadow()
            ]
        ),
        child: Row(children:[
            SizedBox(width:30),
            Container(
                      decoration:BoxDecoration(
                        border:Border.all(color:primaryColor,width: 3),
                        shape:BoxShape.circle,

                      ),
                      child:Container(
                        margin: EdgeInsets.all(10),
                         decoration:BoxDecoration(
                        border:Border.all(color:primaryColor,width: 3),
                        shape:BoxShape.circle,

                      ),

                  child: Container(
                    margin: EdgeInsets.all(10),
                         decoration:BoxDecoration(
                        color: primaryColor,
                        shape:BoxShape.circle,),
                      padding: EdgeInsets.all(10),
                    child: Icon(widget.iconData,color: secondaryColor,size: 30,)),
                      ),
                    ),
                    SizedBox(width:20),
                    Column(
                     children:[
                       SizedBox(height:5),
                       
                       widget.companyName.text.color(primaryColor).size(18).bold.make(),
                       widget.role.text.color(Colors.black).size(22).bold.make(),
                       widget.year.text.color(Colors.black).size(18).bold.make(),
                       SizedBox(height:5),
                       
                     ] ,
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     crossAxisAlignment: CrossAxisAlignment.start,
                    )
        ],
        
        ),
        
      ),
          ),
    );
  }
}