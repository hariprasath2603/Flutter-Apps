import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: MyHomePage(title: 'Music Player'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Color(0xffABB7B7),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(widget.title,style: TextStyle(color: Colors.white30,fontWeight: FontWeight.w700),),
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.search,color: Colors.black45,),
            onPressed: (){},
            
            
          )
        ],
      ),

      bottomNavigationBar: BottomAppBar(
         color: Color(0x8fffffff),
        child:Container(
          height: 50.0,
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 20.0,right: 20.0),
          child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
         Icon(Icons.home,size:20.0,color: Colors.indigoAccent,),
         Icon(Icons.search,size:20.0,color: Colors.black45,),
         Icon(Icons.video_call,size:20.0,color: Colors.black45,),
         Icon(Icons.library_music,size:20.0,color: Colors.black45,),
        ],))
      ),
      body: Column(children: <Widget>[
        Center(
         child:SingleChildScrollView(
           scrollDirection: Axis.horizontal,
          child: 
         Row(
           children: <Widget>[
             
            Container(padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 30.0,bottom: 30.0),child:Card(child: Container(
               width:MediaQuery.of(context).size.width*3.6/4,
              height: MediaQuery.of(context).size.height*1.5/4,
              child:Image.asset("asset/vada.jpg",fit: BoxFit.fill,)),elevation: 4.0,)),

            Container(padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 30.0,bottom: 30.0),child:Card(child: Container(
              width:MediaQuery.of(context).size.width*3.6/4,
              height: MediaQuery.of(context).size.height*1.5/4,
              color: Color(0xff1BBC9B),child:Text("hello")),elevation: 4.0,)),
            //Container(padding: EdgeInsets.only(left: 10.0,right: 10.0,top: 30.0,bottom: 30.0),child:Card(child: Container(color: Colors.lightGreenAccent),elevation: 4.0,)),
           ],
         )
        ,)
        
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
                      Divider(color: Color(0xff2ECC71),endIndent: MediaQuery.of(context).size.width/100*80,),
            ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.skip_previous,color: Colors.black54,),
              Icon(Icons.play_arrow,color: Color(0xff2ECC71),size: 50.0,),
              Icon(Icons.skip_next,color: Colors.black54,),
            ],
          ),
          ]
          ),
        )],)
       ) ],
        )
      );

  }
}
