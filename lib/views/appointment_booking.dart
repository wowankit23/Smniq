import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../Utils/Constants.dart';

class Booking extends StatefulWidget {
  static String TAG = '/BOOKING';
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  TabController tabController;
  String today, tomorrow;

  @override
  void initState() {
    super.initState();
    DateTime now = new DateTime.now();
    today =
        new DateFormat('dd').format(new DateTime(now.year, now.month, now.day));
    tomorrow = new DateFormat('dd')
        .format(new DateTime(now.year, now.month, now.day + 1));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Color(0xFFE5E5E9),
          appBar: AppBar(
            title: Text(
              ChooseATimeSlot,
              style: TextStyle(fontSize: 16),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Column(
                    children: [
                      Text(
                        today,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      Text(
                        'Today',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: [
                      Text(
                        tomorrow,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18),
                      ),
                      Text(
                        'Tomorrow',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: [
                      Icon(Icons.event_available_rounded),
                      Text(
                        'Select',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
          ),
          body: TabBarView(children: [
            ViewToday(context),
            ViewToday(context),
            Center(child: Icon(Icons.calendar_today_rounded)),
          ]),
        ),
      ),
    );
  }

  Widget ViewToday(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: FutureBuilder(
        future:
            DefaultAssetBundle.of(context).loadString('assets/slotList.json'),
        builder: (context, snapshot) {
          var newData = json.decode(snapshot.data.toString());

          return ListView.separated(
            itemCount: newData == null ? 0 : newData.length,
            separatorBuilder: (BuildContext context, int i) {
              return SizedBox(
                height: 8,
              );
            },
            itemBuilder: (BuildContext context, int i) {
              return Container(
                color: Colors.white,
                child: ExpansionTile(
                  title:
                      Text(newData[i]['slotST'] + ' - ' + newData[i]['slotET']),
                  children: [
                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: newData[i]['childSlots'].length,
                      separatorBuilder: (BuildContext context, int j) {
                        return Divider(
                          color: Colors.grey,
                          height: 1,
                        );
                      },
                      itemBuilder: (BuildContext context, int j) {
                        var subSlots = newData[i]['childSlots'];
                        return SlotTile(
                          subSlots[j]['ST'],
                          subSlots[j]['ET'],
                          subSlots[j]['filled'],
                          subSlots[j]['fillStatus'],
                        );
                      },
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget SlotTile(String ST, String ET, int filled, String fillStatus) {
    Color _color;
    if (filled < 50) {
      _color = Colors.green;
    } else if (filled >= 50 && filled < 80) {
      _color = Colors.orange;
    } else if (filled >= 80) {
      _color = Colors.red;
    }
    return Container(
      color: Color(0xfff4f2f2),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                '$ST - $ET',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                width: 150,
                child: LinearProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(_color),
                  value: filled / 100,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                fillStatus,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () {},
            child: Text(JOIN),
          )
        ],
      ),
    );
  }
}
