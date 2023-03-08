import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inspiration_app/shared/heart.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 243, 243, 1),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: 1),
                  duration: Duration(milliseconds: 500),
                  curve: Curves.bounceInOut,
                  builder: (context, double _val, child) {
                    return Opacity(
                      opacity: _val,
                      child: Padding(
                        padding: EdgeInsets.only(top: _val * 20),
                        child: child,
                      ),
                    );
                  },
                  child: Text("Find Your",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25,
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Inspiration",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 40,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(243, 243, 243, 3),
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      cursorColor: Colors.black87,
                      decoration: InputDecoration(
                          hintText: "Search you're looking for",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black87,
                          )),
                    )),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Promo Today",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "( Scroll Right )",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  // color: Colors.white,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _promoCard('assests/images/1.jpg'),
                      _promoCard('assests/images/2.jpg'),
                      _promoCard('assests/images/3.jpg'),
                      _promoCard('assests/images/4.jpg'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                moreInspiration('assests/images/5.jpg'),
                SizedBox(
                  height: 15,
                ),
                moreInspiration('assests/images/6.jpg'),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget moreInspiration(image) {
    return Container(
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
          color: Colors.amber,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
              0.1,
              0.9
            ], colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.1),
            ]),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Best Design",
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
        ));
  }

  Widget _promoCard(image) {
    //width to height ko ratio
    return AspectRatio(
      aspectRatio: 2.65 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
            color: Colors.amber,
            borderRadius: BorderRadius.circular(30)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
              0.1,
              0.9
            ], colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.1),
            ]),
          ),
          child: Align(
            alignment: Alignment.topRight,
            child: Heart(),
          ),
        ),
      ),
    );
  }
}
