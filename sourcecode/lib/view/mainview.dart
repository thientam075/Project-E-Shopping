import 'package:flutter/material.dart';

class MainView extends StatefulWidget {

@override
  State<StatefulWidget> createState(){
    // TODO: implement createState
    return _MainView();
  }

}

class _MainView extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      home: MainPage,
    debugShowCheckedModeBanner: false,);
  }
}
Scaffold MainPage = Scaffold(
appBar: AppBar(
  leading: IconButton(
  icon: const Icon(Icons.arrow_back),
    onPressed: () {  },

  ),
  title: const Text('HomePage',
  textAlign: TextAlign.center,),
),
  body: GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 8,
      children: <Widget>[Product,Product,Product,Product
        ,Product,Product,Product,Product,],),
  bottomNavigationBar: Menu,
);


Row Menu = Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    IconButton(
      iconSize: 40,
    icon:const Icon(Icons.home),
    onPressed: (){},),
    IconButton(
      iconSize: 40,
      icon:const Icon(Icons.search),
      onPressed: (){},),
    IconButton(
      iconSize: 40,
      icon:const Icon(Icons.shopping_cart),
      onPressed: (){},),
    IconButton(
      iconSize: 40,
      icon:const Icon(Icons.person),
      onPressed: (){},),
    IconButton(
      iconSize: 40,
      icon:const Icon(Icons.view_headline_outlined),
      onPressed: (){},),],
);

Container Product = Container(
padding: EdgeInsets.all(32),
  child: Column(
    children: [
      Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWne_qhDnol-Liz7dDd9iSMUhI3x3f6-IqqIVL_tW4Dh5UosZn0bzvJcT8UQ&usqp=CAc'))
    ,SizedBox(height: 32,),const Text('OPPO A93'),
      const Text('5,990,000 đ')
    ],
  ),
);