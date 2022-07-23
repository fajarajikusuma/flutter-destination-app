import 'package:destination_app/detailItem.dart';
import 'package:destination_app/notification.dart';
import 'package:destination_app/popularPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:get_storage/get_storage.dart';
import 'detailItem.dart';
import 'package:google_fonts/google_fonts.dart';
// import http
import 'package:http/http.dart' as http;
// import json
import 'dart:convert';

class CardItem {
  final String title;
  final String price;
  final String img_path;

  CardItem({this.title, this.price, this.img_path});
}

class Beranda extends StatefulWidget {
  const Beranda({Key key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  final String LoggedIn = GetStorage().read('username');
  Future<List> getData() async {
    final response =
        await http.get(Uri.parse("http://192.168.90.112:5001/destinations"));
    Map<String, dynamic> data = json.decode(response.body);
    return data['data'];
  }

  @override
  Widget build(BuildContext context) {
    Widget card({
      CardItem item,
    }) =>
        Container(
          height: 200,
          width: 200,
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Material(
                    child: Ink.image(
                      image: AssetImage(item.img_path),
                      fit: BoxFit.cover,
                      child: InkWell(
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                item.title,
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Text(item.price,
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.indigo)),
            ],
          ),
        );
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 2, bottom: 2),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.indigo[50],
                        ),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 10, left: 10),
                              child: Text(
                                LoggedIn != null ? 'Hello, ' + LoggedIn : 'Anda belum login',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      IconButton(
                        icon: Icon(
                          Icons.notifications,
                          color: Colors.indigo,
                          size: 24,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    Text(
                      'Special For You',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 200,
                  // create child listview separated, showing data from getData()
                  child: FutureBuilder<List>(
                    future: getData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            // check if data['isPromo'] === 1
                            if (snapshot.data[index]['isPromo'] == 1) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailItem(
                                          destination_id:
                                              // convert to int
                                              snapshot.data[index]['id']),
                                    ),
                                  );
                                },
                                child: card(
                                  item: CardItem(
                                    title: snapshot.data[index]['title'],
                                    // convert to string
                                    price:
                                        'Rp. ${snapshot.data[index]['price']}',
                                    img_path: snapshot.data[index]['img_path'],
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Places',
                        style: GoogleFonts.poppins(
                          fontSize: 22,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => popularPage(),
                            ),
                          );
                        },
                        child: Text(
                          'See All',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 380,
                  width: double.infinity,
                  child: FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            if (snapshot.data[index]['rating'] != 5) {
                              return Container();
                            }
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailItem(
                                      destination_id: snapshot.data[index]
                                          ['id'],
                                    ),
                                  ),
                                );
                              },
                              child: card(
                                item: CardItem(
                                  title: snapshot.data[index]['title'],
                                  price: 'Rp. ${snapshot.data[index]['price']}',
                                  img_path: snapshot.data[index]['img_path'],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
