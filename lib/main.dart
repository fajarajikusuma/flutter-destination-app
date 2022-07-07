import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  static const String imageUrl =
      'https://www.setaswall.com/wp-content/uploads/2019/03/Railroad-Grass-Trees-1080x2400-380x844.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: NetworkImage(imageUrl),
          ),
        ),
        child: Stack(
          // fit: StackFit.expand,
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: Colors.black45.withOpacity(0.25),
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: Colors.black45.withOpacity(0.25),
              ),
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: Colors.black26.withOpacity(0.25),
              ),
            ),
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: Colors.black26.withOpacity(0.35),
              ),
            ),
            Positioned(
              top: 400,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: Colors.black12.withOpacity(0.45),
              ),
            ),
            Positioned(
              top: 500,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: Colors.black12.withOpacity(0.5),
              ),
            ),
            Positioned(
              top: 600,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: Colors.black12.withOpacity(0.5),
              ),
            ),
            Positioned(
              top: 700,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Positioned(
              top: 800,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              heightFactor: 4,
              child: Container(
                height: 200,
                width: double.infinity,
                // color: Colors.red.withOpacity(0.5),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Mangkat',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '"Lorem Ipsum is simply dummy text of the printing."',
                            style: TextStyle(
                              // fontSize: 50,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          MaterialButton(
                            height: 50,
                            minWidth: 150,
                            textColor: Colors.white,
                            color: Colors.green,
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ),
                              );
                            },
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
