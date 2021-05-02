import 'package:ark/model/destination.dart';
import 'package:ark/widget/destination_slide.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.car,
    FontAwesomeIcons.parachuteBox,
    FontAwesomeIcons.biking,
  ];
  int _selectedIndex = 0;

  Widget _iconCon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Theme.of(context).accentColor
                : Color(0xFFE7EBEE),
            borderRadius: BorderRadius.circular(50)),
        child: Icon(
          _icons[index],
          color: _selectedIndex == index
              ? Theme.of(context).primaryColor
              : Color(0xFFB4C1C4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 23),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 90),
                child: Text('What you would like to find ?',
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _icons
                      .asMap()
                      .entries
                      .map((MapEntry map) => _iconCon(map.key))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              DestinationSlide(),
              Container(
                height: 250,
                width: 200,
                color: Colors.blue,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: destinations.length,
                    itemBuilder: (BuildContext context, int index) {
                      Destination destination = destinations[index];
                      return Container(
                        margin: EdgeInsets.all(10),
                        color: Colors.red,
                        width: 210.0,
                        child: Stack(
                          children: [
                            Container(
                              width: 200,
                              height: 125,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${destination.activities.length} activities',
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      '${destination.description}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(23),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38,
                                        offset: Offset(0.0, 0.2),
                                        blurRadius: 6.0)
                                  ]),
                              child: Stack(
                                children: [
                                  Image(
                                    height: 100,
                                    image: AssetImage(destination.imageUrl),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
