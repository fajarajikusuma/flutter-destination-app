import 'package:destination_app/detailItem.dart';
import 'package:destination_app/notification.dart';
import 'package:destination_app/popularPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'detailItem.dart';
import 'package:google_fonts/google_fonts.dart';

class CardItem {
  final String title;
  final String price;
  final String imageUrl;

  CardItem({this.title, this.price, this.imageUrl});
}

class Beranda extends StatefulWidget {
  const Beranda({Key key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  List<CardItem> items = [
    CardItem(
      title: 'Bali',
      price: 'Rp. 1.000.000',
      imageUrl: 'assets/img/1.jpg',
    ),
    CardItem(
      title: 'Lombok',
      price: 'Rp. 1.500.000',
      imageUrl: 'assets/img/2.jpeg',
    ),
    CardItem(
      title: 'Bromo',
      price: 'Rp. 700.000',
      imageUrl: 'assets/img/3.jpg',
    ),
    CardItem(
      title: 'Jogja',
      price: 'Rp. 400.000',
      imageUrl: 'assets/img/4.jpg',
    ),
  ];
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
                      image: AssetImage(item.imageUrl),
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
                                "Hi! Dimas Adi",
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
              // SizedBox(
              //   height: 20,
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Container(
              //         width: MediaQuery.of(context).size.width * 0.75,
              //         child: TextField(
              //           decoration: InputDecoration(
              //             labelText: 'Search for your destination',
              //             labelStyle: GoogleFonts.poppins(
              //               fontSize: 16,
              //             ),
              //             border: OutlineInputBorder(
              //               borderRadius: BorderRadius.circular(30),
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         width: MediaQuery.of(context).size.width * 0.12,
              //         child: MaterialButton(
              //           onPressed: () {},
              //           child: Icon(
              //             Icons.search,
              //             color: Colors.white,
              //             size: 24,
              //           ),
              //           color: Colors.indigo,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(30),
              //           ),
              //           height: 50,
              //           minWidth: double.infinity,
              //           padding: EdgeInsets.zero,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
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
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    separatorBuilder: (context, index) => SizedBox(
                      width: 16,
                    ),
                    itemBuilder: (context, index) {
                      return card(item: items[index]);
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
                  height: 430,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailItem()));
                    },
                    child: Container(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
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
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Material(
                                              child: Ink.image(
                                                image: AssetImage(
                                                    'assets/img/1.jpg'),
                                                fit: BoxFit.cover,
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailItem()));
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          width: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Bali',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                'Rp. 1.000.000',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.indigo,
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
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 120,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Card(
                                    elevation: 2,
                                    shadowColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Material(
                                              child: Ink.image(
                                                image: AssetImage(
                                                    'assets/img/1.jpg'),
                                                fit: BoxFit.cover,
                                                child: InkWell(
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          width: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Bali',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                'Rp. 1.000.000',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.indigo,
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
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 120,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Card(
                                    elevation: 2,
                                    shadowColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Material(
                                              child: Ink.image(
                                                image: AssetImage(
                                                    'assets/img/1.jpg'),
                                                fit: BoxFit.cover,
                                                child: InkWell(
                                                  onTap: () {},
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          width: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Bali',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                'Rp. 1.000.000',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.indigo,
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
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
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
