import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detailItem.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Search',
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Search for your destination',
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.12,
                    child: MaterialButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 24,
                      ),
                      color: Colors.indigo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      height: 50,
                      minWidth: double.infinity,
                      padding: EdgeInsets.zero,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                height: 680,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailItem()));
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
    ));
  }
}
