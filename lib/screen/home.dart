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
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Destinations',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          'see all',
                          style: GoogleFonts.poppins(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
