import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'data.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 var  _sliddata = data['body'];
  Widget imgbuildr(index){
    return Builder(
      builder: (BuildContext context)=> GestureDetector(

        child:firstimage( newsimage :  _sliddata![index]['image'].toString(),
            title : _sliddata![index]['title'].toString(),
            cat : _sliddata![index]['date'].toString()
            , id : index
            , i : index),
        onTap: () {



        },
      )
      ,
    );
  }

  List <Widget> listimgs(imgs){
    List <Widget> sliders =[] ;

    for (var i = 0 ; i < imgs.length; i++) {

      sliders.add(imgbuildr(i));
    }
    return sliders;
  }
  Widget mamonattchment(){
    var addr = 0.05;
    if (_sliddata!.length > 0 ){
      var mul = 0.40;
      var mult = 0.15;

      if (MediaQuery.of(context).size.height <= 427){
        mul = 0.48;
        mult = 0.18;

      } else if (MediaQuery.of(context).size.height <= 485 && MediaQuery.of(context).size.height > 427 ){
        mul = 0.43;

        mult = 0.18;

      } else if (MediaQuery.of(context).size.height > 485 && MediaQuery.of(context).size.height <= 560 ){
        mul = 0.392;
        mult = 0.15;

      } else if (MediaQuery.of(context).size.height > 560 && MediaQuery.of(context).size.height <= 597 ){
        mul = 0.37;
        mult = 0.18;
      } else if (MediaQuery.of(context).size.height > 597 && MediaQuery.of(context).size.height <= 850 ){
        mul = 0.37;
        mult = 0.24;

      }else if (MediaQuery.of(context).size.height > 850){

        mul = 0.40;
        mult = 0.26;
      }
      var widtt = MediaQuery.of(context).size.width * 0.4;
      return

        Container( color: Colors.white60,
          height: MediaQuery.of(context).size.height * 0.3,
          child:



          Swiper(itemCount: _sliddata!.length,


            itemBuilder:  (context, index) {
              return imgbuildr(index);
            },

            scrollDirection: Axis.horizontal,

            loop: true,

            control: new SwiperControl(
                color: Colors.red
            ),


            pagination: new SwiperPagination(
                margin: new EdgeInsets.all(5.0),
                builder: new DotSwiperPaginationBuilder(
                    color: Colors.grey, activeColor: Colors.red)

            ),


            viewportFraction: 0.1,

            scale: 2,
            itemHeight: MediaQuery.of(context).size.height * 0.3,
            itemWidth: MediaQuery.of(context).size.width * 0.85 ,
            autoplayDelay: 9250,
            duration: 622,

            layout:
            SwiperLayout.CUSTOM,
            customLayoutOption: new CustomLayoutOption(
              startIndex: -1,
              stateCount: 3,

            ).addOpacity([
              0.6,
              0.6,
              1.0


            ])


                .addRotate([

              0.03,
              0.03,
              0.0

            ])



                .addScale([
              0.8,
              0.8,
              0.96

            ],Alignment.center )

                .addTranslate([
              //offset(left,upp)
              new Offset(-100.0, 5.0),
              new Offset(100 , 5.0 ),
              new Offset(0.0, 0.0)
            ]),
          ) ,
        )

      ;
    } else {
      return Text('connection_error');
    }
  }
  @override
  Widget build(BuildContext context) {


    return
      DefaultTabController(
          length: 2,
          child:
      Scaffold(
      appBar: AppBar(


        title: Text(widget.title),

          bottom: TabBar(

            tabs: [
              Tab(

                text: 'slide' ,

              ),

              Tab(

                text: 'just text',

              ),

            ],

            isScrollable: true


          ),

      ),
      body:

          Center(
            child:


            TabBarView(
              children: [

            mamonattchment(),
    Text('just another tab')





              ],
            ),
          ),




      // This trailing comma makes auto-formatting nicer for build methods.
    )

    );
  }
}


class firstimage extends StatefulWidget {
  String? newsimage;
  String?  title;
  String? cat;
  int? id;
  int? i;
  bool? label;
  String? over;
  firstimage({required this.newsimage, required this.title, required this.cat  , required this.id , required this.i ,this.label = true ,this.over='black'});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SbigImage();
  }

}
class SbigImage extends State<firstimage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return bigImageOverly(widget.newsimage, widget.title, widget.cat  , widget.id , widget.i);
  }


  Widget bigImageOverly(newsimage, title, cat  , id , i) {
    Widget _cats;
    var addo = 0.0;

    if (widget.label == false){
      _cats =    Container(
      );

    } else {
      addo = 0.02;
      _cats =    Container(

        color: Colors.black,
        child: Text(
          cat,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      );



    }


    var mul = 0.40;
    var mult = 0.17;

    print('devis hieght is '  + MediaQuery.of(context).size.height.toString());
    print('devis width  is '  + MediaQuery.of(context).size.width.toString());

    if (MediaQuery.of(context).size.height <= 427){
      mul = 0.35;
      mult = 0.23;
      print(MediaQuery.of(context).size.height);

    } else if (MediaQuery.of(context).size.height <= 485 && MediaQuery.of(context).size.height > 427 ){
      mul = 0.35;
      mult = 0.23;
      print(MediaQuery.of(context).size.height);

    } else if (MediaQuery.of(context).size.height > 485 && MediaQuery.of(context).size.height <= 560 ){
      mul = 0.35;
      mult = 0.23;
      print(MediaQuery.of(context).size.height);

    } else if (MediaQuery.of(context).size.height > 560 && MediaQuery.of(context).size.height <= 597 ){
      mul = 0.37;
      mult = 0.23;
      print(MediaQuery.of(context).size.height);

    } else if (MediaQuery.of(context).size.height > 597 && MediaQuery.of(context).size.height <= 850 ){
      mul = 0.37;
      mult = 0.23;
      print(MediaQuery.of(context).size.height);
    }else if (MediaQuery.of(context).size.height > 850 ){
      print(MediaQuery.of(context).size.height);

      mul = 0.40;
      mult = 0.29;
    }

    if (widget.over == 'white'){
      var ratio = 16/9;

      if (widget.cat == 'auther'){
        ratio = 1/1;
      }
      return Center(
        child:    CachedNetworkImage(

          imageUrl:newsimage,



        ),

      );

    } else {

      var ImagH =   0.20;
      var TitlH = ImagH * 0.68 ;
      var TitlB = ImagH * 0.32 ;

      var FontS = 18.0;
      return  Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Stack(
                children: <Widget>[

                  CachedNetworkImage(

                    imageUrl:newsimage,
                    height: MediaQuery.of(context).size.height *  ImagH
                    ,
                    width: MediaQuery.of(context).size.width * 1,
                    fit: BoxFit.cover,

                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //  verticalDirection: VerticalDirection.up,
                    //  mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      //  _cats,


                      SizedBox(
                        height: MediaQuery.of(context).size.height *  TitlH,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height *  TitlB,
                          width: MediaQuery.of(context).size.width * 1,
                          child: Padding(
                            padding: EdgeInsets.all(9.0),
                            child:    Text(
                              title,
                              overflow: TextOverflow.clip,
                              maxLines: 2,

                              textAlign: TextAlign.center,
                              style: TextStyle(


                                fontWeight: FontWeight.bold
                                ,
                                fontSize: FontS,
                                color: Colors.white,


                              ),
                            ),
                          )

                      ),




                    ],
                  )
                ],
              ),

            ],
          ));

    }

  }

}