import 'package:axa_casper_app/models/activities.dart';
import 'package:axa_casper_app/pages/home/activity_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Theme/theme.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard(this.activity, {super.key});
  final Activites activity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ActivityPage(activity)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: ThemeAxper.textBlue,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Image.network(
                  activity.image,
                  fit: BoxFit.cover,
                ),
              ),
              flex: 2,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                width: double.infinity,
                child: Column(
                  children: [
                    Text(activity.title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            fontSize: 12,
                            color: ThemeAxper.textBlue,
                            fontWeight: FontWeight.w600)),
                    Flexible(
                      child: Text(activity.subtitle,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                              fontSize: 12,
                              color: ThemeAxper.textBlue,
                              fontWeight: FontWeight.w300)),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: ThemeAxper.primaryBlue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
