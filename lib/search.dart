import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detailItem.dart';
// import async and convert
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Widget> _list = [];

  void searchData (){
    var url = Uri.parse("http://192.168.79.104:5001/destinations/name/" +
        _searchController.text);
    http.get(url).then((response) {
      Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        _list = [];
        for (var i = 0; i < data['data'].length; i++) {
          _list.add(SingleChildScrollView(
            child: Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailItem(
                        destination_id: data['data'][i]['id'],
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/img/1.jpg"),
                        fit: BoxFit.cover,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['data'][i]['title'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          // show description but limit to 100 characters
                          data['data'][i]['description'].toString().length > 100
                              ? data['data'][i]['description'].toString()
                                      .substring(0, 100) +
                                  "..."
                              : data['data'][i]['description'].toString(),
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ));
        }
      });
    });
  }

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
                      controller: _searchController,
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
                      onPressed: () {
                        searchData();
                      },
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
                      children: _list,
                    )
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
