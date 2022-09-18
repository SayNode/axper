import 'package:axa_casper_app/models/activities.dart';
import 'package:axa_casper_app/pages/home/activity_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Theme/theme.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage(this.activity, {super.key});
  final Activites activity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.height,
                height: 200,
                child: Image.network(
                  activity.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(activity.description,
                    style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: ThemeAxper.primaryBlue,
                        fontWeight: FontWeight.w600)),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: ThemeAxper.primaryRed,
                ),
                child: Text("Start tracking",
                    style: GoogleFonts.nunito(
                        fontSize: 16,
                        color: ThemeAxper.white,
                        fontWeight: FontWeight.w600)),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
