import 'package:flutter/material.dart';
import './listSongs.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: '/',
      routes: {
        '/songList':(context) =>SongList()
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Music Player',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Colors.indigoAccent,
        elevation: 5.0,
        title: Text(widget.title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.search,color: Colors.white,),
            onPressed: (){},
            
            
          )
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(

        onTap: (index){
          
          if(index==1){
            print(index);
              Navigator.pushNamed(context, '/songList');
          }
        },
         items:  <BottomNavigationBarItem>[
            
         
        BottomNavigationBarItem(
          icon: Icon(Icons.home,size:20.0,color: Colors.indigoAccent,),
          title: Text('Home',style: TextStyle(color: Colors.indigoAccent,),),
        ),  
        BottomNavigationBarItem(
          icon:Icon(Icons.search,size:20.0,color: Colors.black45,),
          title: Text('Home',style: TextStyle(color: Colors.black45,),),
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

      // bottomNavigationBar: BottomAppBar(
      //    color: Color(0xffffffff),
      //    elevation: 5.0,
         
      //   child:Container(
      //     height: 50.0,
      //     color: Colors.transparent,
          
      //     padding: EdgeInsets.only(left: 25.0,right: 20.0),
      //     child:Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //    Icon(Icons.home,size:20.0,color: Colors.indigoAccent,),
      //    Icon(Icons.search,size:20.0,color: Colors.black45,),
      //    Icon(Icons.video_call,size:20.0,color: Colors.black45,),
      //    Icon(Icons.library_music,size:20.0,color: Colors.black45,),
        
      //   ],))
      // ),
      body: Column(children: <Widget>[
        Center(
             
           child: Container(padding: EdgeInsets.only(left: 35.0,right: 35.0,top: 30.0,bottom: 30.0),child:Card(child: Container(
               width:MediaQuery.of(context).size.width*3/4,
              height: MediaQuery.of(context).size.height*1.5/4,
              child:Image.asset("asset/vada.jpg",fit: BoxFit.fill,)),elevation: 4.0,)),

          
        
        ),
      Container(
        height: MediaQuery.of(context).size.height*1.3/4,
        
        child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
       Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        Container(child: Center(child: Text("Ennadi Mayavi",style:TextStyle(fontWeight: FontWeight.w800,fontSize: 20.0,letterSpacing: 2)),),),
        
        Container(child: Center(child: Text("Vada chennai",style:TextStyle(fontWeight: FontWeight.w400)),),),
        
        Container(child: Center(child: Text("Sid Sriram,Santhosh Narayanan",style:TextStyle(fontWeight: FontWeight.w200)),),),
  ],
          ),

          Container(
            padding: EdgeInsets.only(left:20.0,right:20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              Icon(Icons.arrow_downward,color: Colors.black54,),
              Icon(Icons.repeat,color: Colors.black54,),
              Icon(Icons.update,color: Colors.black54,),
              Icon(Icons.equalizer,color: Colors.black54,),

          ],),),

        Container(
          child:   Column(children: <Widget>[
            Stack(children: <Widget>[
                      Divider(color: Colors.black12),
                      Divider(color:Colors.indigoAccent,endIndent: MediaQuery.of(context).size.width/100*80,),
            ],),
         InteractiveButtons(),
          ]
          ),
        )],)
       ) ],
        )
      );

  }
}


class InteractiveButtons extends StatefulWidget {
  var  buttonToggel=Icons.play_arrow;
  @override
  _InteractiveButtonsState createState() => _InteractiveButtonsState();
}

class _InteractiveButtonsState extends State<InteractiveButtons> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
     child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.skip_previous,color: Colors.black54,),
              GestureDetector (child:Icon(widget.buttonToggel,color:Colors.indigoAccent,size: 50.0,),
              onTap: (){
                print("tapped");
                  if(widget.buttonToggel==Icons.play_arrow)
                  setState(() {widget.buttonToggel=Icons.pause;});
                  else
                  setState(() {
                  widget.buttonToggel=Icons.play_arrow;
                  });
              },),
              Icon(Icons.skip_next,color: Colors.black54,),
            ],
          ),
    );
  }
}