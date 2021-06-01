import 'package:nectar/views/appointment_booking.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import '../Utils/Colors.dart';
import '../Utils/Constants.dart';

class Dashboard extends StatefulWidget {
  static String routeName = "/home";

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static String TAG = 'DASHBOARD';

  String _selectedCity="Kanpur";
  List data;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(BackgroundColor),
        appBar: AppBar(
          leading: Icon(Icons.location_on_rounded),
          title: DropdownButton<String>(
            focusColor: Colors.white,
            value: _selectedCity,

            style: TextStyle(color: Colors.white),
            iconEnabledColor: Colors.white,
            items: <String>[
              'Pune',
              'Kanpur',
              'Indore',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            hint: Text(
              PleaseSelectACity,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            onChanged: (String value) {
              setState(() {
                _selectedCity = value;
              });
            },
          ),
          actions: [
            IconButton(icon: Icon(Icons.search_rounded), onPressed: () {}),
            IconButton(icon: Icon(Icons.filter_list_rounded), onPressed: () {}),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Card(
                  margin: EdgeInsets.all(0),
                  child: Stack(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                        child: Row(
                          children: [
                            Image.network(
                              'https://cdn.iconscout.com/icon/premium/png-256-thumb/doctor-appointment-1981618-1676696.png',
                              width: 50.0,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome!',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  Text(
                                    'Book last minute appointments, pay your doctor\'s consultaion fees online, and save your prescription on the all new Smiq App',
                                    style: TextStyle(fontSize: 11),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: IconButton(
                          icon: Icon(Icons.close_rounded),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.stream)),
                      (_selectedCity == null)
                          ? Text('Please Select City')
                          : Text('Doctors in $_selectedCity')
                    ],

                )
                ,
                SizedBox(
                  height: 16,
                ),
                (_selectedCity != null)
                    ? FutureBuilder(
                        future: DefaultAssetBundle.of(context)
                            .loadString('assets/docList.json'),
                        builder: (context, snapshot) {
                          var newData = json.decode(snapshot.data.toString());

                          return ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: newData == null ? 0 : newData.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 8,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return DocCard(
                                newData[index]['name'],
                                newData[index]['spec'],
                                newData[index]['loc'],
                                isPinned: newData[index]['isPinned'],
                              );
                            },
                          );
                        },
                      )
                    : SizedBox(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Stack(
            fit: StackFit.loose,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: IconButton(onPressed: () {}, icon: Icon(Icons.book_online)),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.live_help)),
                  ),
                  Expanded(
                    child: FloatingActionButton(
                      onPressed: () {},
                      child: Icon(Icons.camera_enhance_outlined),
                      elevation: 4.0,
                    ),
                  ),
                  Expanded(
                    child: IconButton(onPressed: () {}, icon: Icon(Icons.history)),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.settings)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget DocCard(String name, String spec, String loc,
      {bool isPinned = false}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Booking()));
      },
      child: Card(
        margin: EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              right: 10,
              top: -3,
              child: (isPinned)
                  ? Icon(Icons.bookmark_sharp, color: Colors.red)
                  : SizedBox(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                      backgroundImage:
                      NetworkImage(dummyImage),

                      backgroundColor: Colors.red
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        Text(
                          spec,
                          style: TextStyle(fontSize: 11, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(loc),
                            Spacer(),
                            Icon(
                              Icons.credit_card_rounded,
                              color: Colors.grey,
                              size: 16,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              GoCashLess,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
