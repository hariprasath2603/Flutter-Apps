import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './player.dart';

void main() {
  runApp(
    ChewieDemo(),
  );
}


class ChewieDemo extends StatefulWidget {
  ChewieDemo({this.title = 'Friends'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
 
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/page':(context)=>VideoStart(),
        },

      debugShowCheckedModeBanner: false,
      title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.orangeAccent,
          bottomOpacity: 0.3,
        ),
        body: HomeStart(),
        
        ),
    );
  }
}



class HomeStart extends StatefulWidget {
  @override
  _HomeStartState createState() => _HomeStartState();
}

class _HomeStartState extends State<HomeStart> {
  @override
  Widget build(BuildContext context) {
    return 
    Container(
       margin: EdgeInsets.only(left:10,right:10),
      child: 
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
      
            
            Container(
              
             
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: <Widget>[
            Container(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              
              children: <Widget>[
                SeassonPoster(url:"asset/frame_00_delay-0.3s.jpg" ,colorBack: Colors.blueAccent,), 
                SeassonPoster(url:"asset/frame_01_delay-0.3s.jpg" ,colorBack: Colors.redAccent,), 
              ],
            ),
            Container(height: 10,),

                         Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SeassonPoster(url:"asset/frame_02_delay-0.3s.jpg" ,colorBack: Colors.cyanAccent,), 
                SeassonPoster(url:"asset/frame_03_delay-0.3s.jpg" ,colorBack: Colors.orangeAccent,), 
              ],
            ),
            Container(height: 10,),
                        Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SeassonPoster(url:"asset/frame_04_delay-0.3s.jpg" ,colorBack: Colors.purpleAccent,), 
                SeassonPoster(url:"asset/frame_05_delay-0.3s.jpg" ,colorBack: Colors.greenAccent,), 
              ],
            )  ,   
          Container(height: 10,),
         Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SeassonPoster(url:"asset/frame_06_delay-0.3s.jpg" ,colorBack: Colors.pinkAccent,), 
                SeassonPoster(url:"asset/frame_07_delay-0.3s.jpg" ,colorBack: Colors.blueAccent,), 
              ],
            )  ,   
          Container(height: 10,),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SeassonPoster(url:"asset/frame_08_delay-0.3s.jpg" ,colorBack: Colors.orange,), 
                SeassonPoster(url:"asset/frame_09_delay-0.3s.jpg" ,colorBack: Colors.red,), 
              ],
            )  ,   
                    
                    
                    
                                  ],
            )
              )
          ]
          ,)
            );
  }
}



class SeassonPoster extends StatefulWidget {
  final url,colorBack;
  SeassonPoster({@required this.url,this.colorBack});
  @override
  _SeassonPosterState createState() => _SeassonPosterState();
}

class _SeassonPosterState extends State<SeassonPoster> {
  @override
  Widget build(BuildContext context) {
    return 
                  GestureDetector(child:Container(        
                      decoration: BoxDecoration(
                          boxShadow: [new BoxShadow(
                                    color: widget.colorBack,
                                    offset: Offset(0, 5),
                                    blurRadius: 10.0,
                                  ),],    
                        image: DecorationImage(image: AssetImage(widget.url),fit: BoxFit.cover,),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: widget.colorBack
                      ),
                      width: MediaQuery.of(context).size.width*4/10,
                      height: 100,
                      
                  ),
                  onTap: (){
                    print("Tapped");
                    Navigator.pushNamed(context, '/page');
                  },
                  );
  }
}





class VideoStart extends StatefulWidget {
  @override
  _VideoStartState createState() => _VideoStartState();
}

class _VideoStartState extends State<VideoStart> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Player"),
          backgroundColor: Colors.orangeAccent,
          bottomOpacity: 0.3,
        ),body:Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Column(children: <Widget>[
                  PlayerStarts(url:'http://dl4.fardasub.xyz/files/Serial/Friends/S03/720p/Friends.S03E02.720p.BluRay.PaHe.Farda.DL.mkv',),

            Container(
              
              margin: EdgeInsets.only(left:10,right:10),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: <Widget>[
                                   Container(
                   
                   margin: EdgeInsets.only(top: 20),
                   alignment: Alignment.centerLeft,child: Text("The One Where No One's Ready",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)),

                  Divider(height: 30, color:Colors.black54),

                  Container(
                   margin: EdgeInsets.only(),
                   alignment: Alignment.centerLeft,child: Text("Description",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),)),

                    Container(
                   margin: EdgeInsets.only(top:10,bottom: 20),
                   alignment: Alignment.centerLeft,child: Text(" 'The One Where No One's Ready' is the second episode of the third season of the American television situation comedy Friends and 50th overall, which aired on NBC on September 26, 1996. The plot centers on Ross's (David Schwimmer) anxiety as his friends take ... Where No One's Ready",textAlign: TextAlign.justify,style: TextStyle(fontSize: 10,),)),
                    
                    
                                  ],
            )
              )
              ],
              )
                
              ),
          ]
            )
            
    );
  }
}

