import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:adhara_socket_io/adhara_socket_io.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:portfolio/Pages/firstPage.dart';
import 'package:portfolio/Pages/secondPage.dart';
import 'package:portfolio/Pages/thirdPage.dart';
import 'package:portfolio/costants.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:web_socket_channel/io.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  // HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  
  
  runApp(MyApp());
}



Future sokcetConnection()async{

  SocketIOManager manager=SocketIOManager();
      SocketIO socket = await manager.createInstance(SocketOptions(
      //Socket IO server URI
        "http://209.59.158.15:3001/",
      
        transports: [Transports.WEB_SOCKET/*, Transports.POLLING*/] ,
        
        
       
    ));
    socket.onConnect((data) {
      print("Connected");
      
    });
    socket.onConnectError((data)=>print(data));
    socket.onConnectTimeout((data)=>print(data));
    socket.onError((data)=>print(data));
    socket.onDisconnect((data)=>print(data));

    socket.on("mcxratesupdate:App\\Events\\MCXRateUpdates", (data) { print(data);});
   
    socket.connect();
    
  }







class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        scaffoldBackgroundColor: backGroundColor,
        primaryColor: primaryColor,
        accentColor: secondaryColor,
        // primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<Widget> pageView = [firstPage(), SecondPage()];
  PageController pageController;
  int page = 0;
  TabController tabController;
  Socket socket;
  var channel;

@override
  void dispose() {
   pageController.dispose();
   tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // channel=IOWebSocketChannel.connect('http://209.59.158.15:3001/');
    tabController = TabController(vsync: this, length: 5);
    pageController = PageController(initialPage: 0, keepPage: true);
    // webSocket();

  }

  

  Color firstColor = primaryColor;
  Color secondColor = secondaryColor;

  @override
  Widget build(BuildContext context) {
    // webSocket();
    return LayoutBuilder(
      
      builder: (context,constraints ) {
        return Scaffold(
          endDrawer: constraints.maxWidth<1000?Drawer():Container(),
          appBar: AppBar(

            
            
            elevation: page == 0 ? 0 : 6,
            backgroundColor: page == 0 ? backGroundColor : secondaryColor,
            leading: Container(),
            actions:[
             
         if(constraints.maxWidth>1000)  Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TabBar(
                    onTap: (i) {
                      print(i);

                      pageController.animateToPage(i,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInSine);
                      // pageController.jumpToPage  (i);
                    },
                    enableFeedback: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 4,
                    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
                   
                    controller: tabController,
                    labelColor: page == 0 ? secondaryColor : backGroundColor,
                    indicatorColor: page == 0 ? secondaryColor : primaryColor,
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(text: "Home"),
                      Tab(text: "About"),
                      Tab(text: "Services"),
                      Tab(text: "Portfolio"),
                      Tab(text: "Contact")
                    ]),
              ),
            if(constraints.maxWidth>1250)  Padding(
                  padding: const EdgeInsets.only(right: 20),
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
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: AnimatedContainer(
                         duration: Duration(milliseconds:500),
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
                              "HIRE ME",
                              style: TextStyle(color: secondColor),
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                              height: kToolbarHeight,
                              width: 49,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: secondColor, width: 2)),
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: secondColor,
                                    border:
                                        Border.all(color: secondColor, width: 2)),
                                child: Icon(
                                  Icons.arrow_forward_sharp,
                                  color: firstColor,
                                  size: 30,
                                ),
                              ))
                        ]),
                      ),
                    ),
                  ))
            ],
            title: Container(
                height: MediaQuery.of(context).size.height * 0.04,
                child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child: page == 0
                        ? GestureDetector(child: Image.asset("assets/logo1.png"))
                        : Image.asset("assets/logo2.png"))),
          ),
          body: PageView(
              pageSnapping: false,
              onPageChanged: (val) {
                
                setState(() {
                  page = val;

                  tabController.animateTo(val,curve: Curves.easeIn,duration: Duration(milliseconds:500));
                });
              },
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              controller: pageController,
              children: [
                firstPage(
                  pageController: pageController,
                ),
                SecondPage(),
                ThirdPage(pageController: pageController,)
              ]),
        );
      }
    );
  }
}







// To parse this JSON data, do
//
//     final goldPrice = goldPriceFromJson(jsonString);



// To parse this JSON data, do
//
//     final goldPrice = goldPriceFromJson(jsonString);


List<GoldPrice> goldPriceFromJson(String str) => List<GoldPrice>.from(json.decode(str).map((x) => GoldPrice.fromJson(x)));

String goldPriceToJson(List<GoldPrice> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GoldPrice {
    GoldPrice({
        this.gold1Bid,
        this.gold1Ask,
        this.gold1Low,
        this.gold1Close,
        this.gold1Ltp,
        this.gold1Symbol,
        this.gold1Open,
        this.gold1High,
    });

    String gold1Bid;
    String gold1Ask;
    String gold1Low;
    String gold1Close;
    String gold1Ltp;
    String gold1Symbol;
    String gold1Open;
    String gold1High;

    factory GoldPrice.fromJson(Map<String, dynamic> json) => GoldPrice(
        gold1Bid: json["gold1_bid"],
        gold1Ask: json["gold1_ask"],
        gold1Low: json["gold1_low"],
        gold1Close: json["gold1_close"],
        gold1Ltp: json["gold1_ltp"],
        gold1Symbol: json["gold1_symbol"],
        gold1Open: json["gold1_open"],
        gold1High: json["gold1_high"],
    );

    Map<String, dynamic> toJson() => {
        "gold1_bid": gold1Bid,
        "gold1_ask": gold1Ask,
        "gold1_low": gold1Low,
        "gold1_close": gold1Close,
        "gold1_ltp": gold1Ltp,
        "gold1_symbol": gold1Symbol,
        "gold1_open": gold1Open,
        "gold1_high": gold1High,
    };
}
