import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DestinationSlide extends StatefulWidget {
  @override
  _DestinationSlideState createState() => _DestinationSlideState();
}

class _DestinationSlideState extends State<DestinationSlide> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20),
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
    );
  }
}
