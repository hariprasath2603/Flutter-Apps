import 'package:chewie/chewie.dart';
import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';





class VideoStart extends StatefulWidget {
String url;
  VideoStart({this.url});
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
                  PlayerStarts(url:widget.url,),

            Container(
              
              margin: EdgeInsets.only(left:10,right:10),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: <Widget>[
                                   Container(
                   
                   margin: EdgeInsets.only(top: 20),
                   alignment: Alignment.centerLeft,child: Text(widget.url,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700),)),

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


class PlayerStarts extends StatefulWidget {
  final url;
  PlayerStarts({this.url});
  @override
  _PlayerStartsState createState() => _PlayerStartsState();
}

class _PlayerStartsState extends State<PlayerStarts> {
  VideoPlayerController _videoPlayerController1;
  VideoPlayerController _videoPlayerController2;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(widget.url);        
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
       //materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
       //  bufferedColor: Colors.lightGreen,
       //),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _videoPlayerController2.dispose();
    _chewieController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
                      child: Chewie(
                  controller: _chewieController,
                ),

    );
  }
}