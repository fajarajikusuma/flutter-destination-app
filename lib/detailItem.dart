import 'package:destination_app/home.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'login.dart';

class DetailItem extends StatefulWidget {
  final int destination_id;
  // callback with return value
  // fetch data from API and convert to json and save it to variable
  DetailItem({Key key, this.destination_id}) : super(key: key);

  @override
  State<DetailItem> createState() => _DetailItemState();
}

class _DetailItemState extends State<DetailItem> {
  @override
  int numOfItems = 1;
  Future<List> getData() async {
    final response = await http.get(Uri.parse(
        "http://3.1.84.135:5001/destinations/id/${widget.destination_id}"));
    Map<String, dynamic> data = json.decode(response.body);
    return data['data'];
  }

  void Transaction(user_id, destination_id, numOfItems) async {
    var data = await getData();
    var total = data[0]['price'] * numOfItems;
    final response = await http
        .post(Uri.parse("http://3.1.84.135:5001/transactions"), body: {
      'userId': user_id.toString(),
      'destinationId': destination_id.toString(),
      'quantity': numOfItems.toString(),
      'total': total.toString()
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        // backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
      child: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  shrinkWrap: true,
                  // physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    // split snapshot.data.index.info into array, store it to variable
                    List<String> info = snapshot.data[index]['info'].split('|');
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(snapshot.data[index]['img_path']),
                          fit: BoxFit.fitHeight,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.darken),
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height,
                            child: Stack(
                              children: [
                                Container(
                                  margin:
                                      EdgeInsets.only(top: size.height * 0.5),
                                  padding: EdgeInsets.only(
                                    top: 25,
                                    left: 25,
                                    right: 25,
                                  ),
                                  height: 470,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(25),
                                      topRight: Radius.circular(25),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data[index]['title'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 23),
                                              ),
                                              Text(
                                                snapshot.data[index]
                                                    ['subtitle'],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        snapshot.data[index]['description'],
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 40,
                                                height: 32,
                                                child: MaterialButton(
                                                  color: Colors.red,
                                                  padding: EdgeInsets.zero,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  onPressed: () async {
                                                    if (numOfItems > 1) {
                                                      numOfItems--;
                                                      setState(() {});
                                                    }
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 7.5),
                                                child: Text(
                                                  this.numOfItems.toString(),
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 40,
                                                height: 32,
                                                child: MaterialButton(
                                                  color: Colors.indigo,
                                                  padding: EdgeInsets.zero,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      // increment jumlah property from Jumlah class
                                                      numOfItems++;
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            // margin: EdgeInsets.only(right: 20),
                                            padding: EdgeInsets.only(
                                                right: 10, left: 10),
                                            width: 70,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.indigo[50],
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(2),
                                                  height: 32,
                                                  width: 32,
                                                  decoration: BoxDecoration(
                                                    color: Colors.black,
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                  ),
                                                ),
                                                Text(
                                                  snapshot.data[index]['rating']
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 25),
                                        child: Row(
                                          children: [
                                            Container(
                                              margin:
                                                  EdgeInsets.only(right: 25),
                                              height: 50,
                                              width: 58,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                    color: Colors.indigo),
                                              ),
                                              child: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.card_giftcard,
                                                  color: Colors.indigo,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: SizedBox(
                                                height: 50,
                                                child: FlatButton(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  color: Colors.indigo,
                                                  onPressed: () {
                                                    // create confirmation dialog
                                                    showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title:
                                                                Text('Confirm'),
                                                            content: Text(
                                                                'Yakin ingin memesan ${numOfItems} tiket ke ${snapshot.data[index]['title']}? \n \n Total harga: \$ ${numOfItems * snapshot.data[index]['price']}'),
                                                            actions: [
                                                              FlatButton(
                                                                child: Text(
                                                                    'Cancel'),
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              ),
                                                              FlatButton(
                                                                child: Text(
                                                                    'Confirm'),
                                                                onPressed: () {
                                                                  // get value from GetSTORAGE
                                                                  var isLoggedIn =
                                                                      GetStorage()
                                                                          .read(
                                                                              'username');
                                                                  var id_user =
                                                                      GetStorage()
                                                                          .read(
                                                                              'user_id');
                                                                  Transaction(
                                                                      id_user,
                                                                      widget
                                                                          .destination_id,
                                                                      numOfItems);
                                                                  // Navigator.push(
                                                                  //     context,
                                                                  //     MaterialPageRoute(
                                                                  //         builder: (context) =>
                                                                  //             HomePage(selected: 1)));
                                                                  Navigator.pushAndRemoveUntil(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                          builder:
                                                                              (context) {
                                                                    if (isLoggedIn !=
                                                                        null) {
                                                                      return HomePage(
                                                                          selected:
                                                                              1);
                                                                    } else {
                                                                      return HomePage(
                                                                          selected:
                                                                              2);
                                                                    }
                                                                  }),
                                                                      (route) =>
                                                                          false);
                                                                },
                                                              ),
                                                            ],
                                                          );
                                                        });
                                                  },
                                                  child: Text(
                                                    'Order Now'.toUpperCase(),
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 25),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(
                                                Icons.arrow_back,
                                                color: Colors.white,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.share,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        info[0],
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        info[1],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 190,
                                      ),
                                      Row(
                                        children: [
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(text: "Price\n"),
                                                TextSpan(
                                                  text:
                                                      "\$ ${snapshot.data[index]['price']}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })
              : Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
        },
      ),
    ));
  }
}
