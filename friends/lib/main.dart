import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './player.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

var apiData;
var mainUrl,mainSeasson;
void main() {
  runApp(
    ChewieDemo(),
  );
}



Future fetchPost() async {
  final response =
      await http.get('https://raw.githubusercontent.com/hariprasath2603/apis/master/friends.json');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    apiData=json.decode(response.body);
    // print("base url"+ apiData["video"]["base"].toString());
    // print("base url"+ apiData["video"]["s1"][0].toString());

    // for (int i=0;i< apiData["video"][se].length;i++){
    //         print(apiData["video"]["base"].toString()+ apiData["video"]["s1"][i].toString());
    // }
    return json.decode(response.body);
  } else {
    // If that call was not successful, throw an error.
    print('Failed to load post');
  }
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
    fetchPost();
    return MaterialApp(
        initialRoute: '/',
        routes: {
          '/player':(context)=>VideoStart(url: mainUrl,),
          '/episodes':(context)=>EpisodeBuilder(season: mainSeasson,),
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
                SeassonPoster(url:"asset/frame_00_delay-0.3s.jpg" ,seasson: "S01",colorBack: Colors.blueAccent,), 
                SeassonPoster(url:"asset/frame_01_delay-0.3s.jpg" ,seasson: "S02",colorBack: Colors.redAccent,), 
              ],
            ),
            Container(height: 10,),

                         Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SeassonPoster(url:"asset/frame_02_delay-0.3s.jpg" ,seasson: "S03",colorBack: Colors.cyanAccent,), 
                SeassonPoster(url:"asset/frame_03_delay-0.3s.jpg" ,seasson: "S04",colorBack: Colors.orangeAccent,), 
              ],
            ),
            Container(height: 10,),
                        Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SeassonPoster(url:"asset/frame_04_delay-0.3s.jpg" ,seasson: "S05",colorBack: Colors.purpleAccent,), 
                SeassonPoster(url:"asset/frame_05_delay-0.3s.jpg" ,seasson: "S06",colorBack: Colors.greenAccent,), 
              ],
            )  ,   
          Container(height: 10,),
         Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SeassonPoster(url:"asset/frame_06_delay-0.3s.jpg" ,seasson: "S07",colorBack: Colors.pinkAccent,), 
                SeassonPoster(url:"asset/frame_07_delay-0.3s.jpg" ,seasson: "S08",colorBack: Colors.blueAccent,), 
              ],
            )  ,   
          Container(height: 10,),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SeassonPoster(url:"asset/frame_08_delay-0.3s.jpg" ,seasson: "S09",colorBack: Colors.orange,), 
                SeassonPoster(url:"asset/frame_09_delay-0.3s.jpg" ,seasson: "S10",colorBack: Colors.red,), 
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
  final url,colorBack,seasson;
  SeassonPoster({@required this.url,this.colorBack,this.seasson});
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
                    print(widget.seasson);
                    mainSeasson=widget.seasson;
                    Navigator.pushNamed(context, '/episodes');
                  },
                  );
  }
}


class EpisodeBuilder extends StatefulWidget {
  var season;
  EpisodeBuilder({this.season});
  @override
  _EpisodeBuilderState createState() => _EpisodeBuilderState();
}

class _EpisodeBuilderState extends State<EpisodeBuilder> {
  @override
  Widget build(BuildContext context) {
    print(widget.season);
    print(apiData);
    return Scaffold(
        appBar: AppBar(
          title: Text("Player"),
          backgroundColor: Colors.orangeAccent,
          bottomOpacity: 0.3,),
          body:Container(
      child: ListView.builder
  (
    itemCount:  apiData["video"][widget.season].length,
    itemBuilder: (BuildContext ctxt, int index) {
     return Container(
       margin: EdgeInsets.only(right: 20,left: 20),
       child: Column(children: <Widget>[
          EpisodeTile(url:apiData["video"]["base"+widget.season].toString()+apiData["video"][widget.season][index].toString(),season: widget.season,index: index+1,),
          Divider(color: Colors.black54,)
       ],)
     );
    }
  )
          ),
    );
  }
}



class EpisodeTile extends StatefulWidget {
  var index,season,url;
  EpisodeTile({this.index,this.season,this.url});
  @override
  _EpisodeTileState createState() => _EpisodeTileState();
}

class _EpisodeTileState extends State<EpisodeTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:GestureDetector(
        child:Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child:Text("Friends - "+ widget.season.toString() +".E"+widget.index.toString()),
        ) ,
                onTap: (){
                    print("Tapped");
                     mainUrl=widget.url;
                    Navigator.pushNamed(context, '/player' ,);
                  },
      )
    );
  }
}