import 'package:flutter/material.dart';
import 'package:nhu/Views/Widget/Product_Widget.dart';

class Homepage extends StatelessWidget{
  const Homepage({super.key});
  void onPress() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.amberAccent[100],
        leading: IconButton(
          onPressed: onPress,
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: onPress,
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: onPress,
            icon: Icon(Icons.store),
          ),
          IconButton(
            onPressed: onPress,
            icon: Icon(Icons.music_note),
          ),
        ],
      ),
      // body: Column(
      //   children: [
      //     Image.asset(
      //       "assets/images/nhu.jpg",
      //       height: 200,
      //       fit: BoxFit.cover,
      //     ),
      //
      //     ProductWidget(),
      //   ],
      // ),
      body: ProductWidget(),

      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Settings",
            icon: Icon(Icons.settings, color: Colors.blueAccent,),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite, color: Colors.pink,),
          ),
        ],
      ),
      // body: SafeArea(
      //   child: RichText(
      //     text: TextSpan(
      //       text: "Hello ",
      //       style: TextStyle(
      //         color: Colors.deepPurple,
      //         fontSize: 20,
      //         fontWeight: FontWeight.bold,
      //       ),
      //       children: [
      //         TextSpan(
      //           text: "World ",
      //           style: TextStyle(
      //             color: Colors.blue,
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}