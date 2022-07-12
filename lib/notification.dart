import 'package:destination_app/detailNotification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     'Notification',
      //     style: TextStyle(
      //         fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo),
      //   ),
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: Colors.indigo,
      //     ),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      // ),
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
                        'Notification',
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
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  height: 680,
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => detailNotification()));
                    },
                    child: Container(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        children: [
                          Container(
                            height: 120,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Card(
                                    color: Colors.indigo[50],
                                    elevation: 2,
                                    shadowColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          width: 350,
                                          // color: Colors.indigo[50],
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Promo',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                'Hari Terakhir Cashback 60% 😘',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'Buruan Klaim Kuponnya Sekarang yaaa...',
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
                            height: 10,
                          ),
                          Container(
                            height: 120,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Card(
                                    // color: Colors.indigo[,
                                    elevation: 2,
                                    shadowColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          width: 350,
                                          // color: Colors.indigo[50],
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Promo',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              Text(
                                                'Hari Terakhir Cashback 60% 😘',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                'Buruan Klaim Kuponnya Sekarang yaaa...',
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
