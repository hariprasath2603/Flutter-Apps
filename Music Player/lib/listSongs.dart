
import 'package:flutter/material.dart';


class SongList extends StatefulWidget {
  var color1=Colors.indigoAccent;
  @override
  _SongListState createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Colors.indigoAccent,
        elevation: 5.0,
        title: Text("Music Player",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.search,color: Colors.white,),
            onPressed: (){},
            
            
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(

        onTap: (index){
          
          if(index==0){
            print(index);
           setState(() {
              widget.color1=Colors.indigoAccent;
              Navigator.pushNamed(context, '/');
           });
          }
        },
        currentIndex: 1,
         items:  <BottomNavigationBarItem>[
            
         
        BottomNavigationBarItem(
          icon: Icon(Icons.home,size:20.0,color: Colors.black45,),
          title: Text('Home',style: TextStyle(color: Colors.black45,),),
        ),  
        BottomNavigationBarItem(
          icon:Icon(Icons.search,size:20.0,color: Colors.indigoAccent,),
          title: Text('Search',style: TextStyle(color: Colors.indigoAccent,),),
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.video_call,size:20.0,color: Colors.black45,),
          title: Text('School',style: TextStyle(color: Colors.indigoAccent,),),
        ),
        BottomNavigationBarItem(
          icon:Icon(Icons.library_music,size:20.0,color: Colors.black45,),
          title: Text('School',style: TextStyle(color: Colors.indigoAccent,),),
        ),
      ],
      ),

      
      
      body:Container(
        margin: EdgeInsets.only(top:10),
      child: ListView(
        children: <Widget>[
          Song(songName: "Enadi Mayavi",singers:"Sid Sriram Hari Prasath",album: "Vada Chennai",),
                    Song(songName: "Life of Ram",singers:"Pradeep Kumar Govind Vasantha",album: "96",),
          Song(songName: "Enga ooru madrasu",singers:" Hariharasudhan, Mee..",album: "Madras",),

          
          // Song(),
          // Song(),
          // Song(),

        ],
      ),
    ),
    );
  }
}

class Song extends StatefulWidget {
  String songName="hello",singers="hello",album="hello";
  @override
  Song({Key key,this.songName,this.singers,this.album}):super(key:key);
  _SongState createState() => _SongState();
}

class _SongState extends State<Song> {
  @override
  Widget build(BuildContext context) {
    //print(widget.songName);
    return Container(
      margin: EdgeInsets.only(top:5),
      height: 55,
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[

                     
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
        Container(
          
          
          child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          Container(alignment: Alignment.centerLeft,
          constraints: BoxConstraints(maxWidth:MediaQuery.of(context).size.width*3/4),
      child:Text(widget.songName +" - "+ widget.singers,textAlign: TextAlign.left,style:TextStyle(fontSize: 15,fontWeight:FontWeight.w500,),),),
         Container(alignment: Alignment.centerLeft,
      child: Text(widget.album,style:TextStyle(fontSize: 13,fontWeight:FontWeight.w400,),),),
        ],),
        ),
        Icon(Icons.more_vert,color: Colors.black54,),
      ],),
       Divider(color: Colors.black54),
                             
      ],)
    );
  }
}