import 'package:destination_app/detailItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
// import http, convert and async
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'beranda.dart';

class popularPage extends StatefulWidget {
  const popularPage({Key key}) : super(key: key);

  @override
  State<popularPage> createState() => _popularPageState();
}

class _popularPageState extends State<popularPage> {
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
        child: Center(
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 20, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 5, bottom: 2, top: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.indigo[50],
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon:
                              Icon(Icons.arrow_back_ios, color: Colors.indigo),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'All Destinations',
                        style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Container(
                  height: 821,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {},
                    child: FutureBuilder<List>(
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
                              // return GestureDetector(
                              //   child: card(
                              //     item: CardItem(
                              //       title: snapshot.data[index]['title'],
                              //       // conert to string to int
                              //       price: snapshot.data[index]['price']
                              //           .toString(),
                              //       img_path: snapshot.data[index]['img_path'],
                              //     ),
                              //   ),
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => DetailItem(
                              //           destination_id: snapshot.data[index]
                              //               ['id'],
                              //         ),
                              //       ),
                              //     );
                              //   },
                              // );
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
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 120,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Card(
                                                elevation: 2,
                                                shadowColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 180,
                                                      height: 120,
                                                      // child: Expanded(
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Material(
                                                          child: Image(
                                                              image: AssetImage(
                                                                  snapshot.data[
                                                                          index]
                                                                      [
                                                                      'img_path']),
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                      ),
                                                      // ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      width: 190,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            '${snapshot.data[index]['title']}',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          Text(
                                                            '${snapshot.data[index]['description'].toString().length > 80 ? '${snapshot.data[index]['description'].substring(0, 80)}...' : snapshot.data[index]['description']}',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          Text(
                                                            '\$${snapshot.data[index]['price']}',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.indigo,
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
                                    ],
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
