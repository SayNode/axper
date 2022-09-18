import 'package:axa_casper_app/models/activities.dart';
import 'package:axa_casper_app/pages/home/activity_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Theme/theme.dart';
import '../../models/rewards.dart';

class RewardPage extends StatelessWidget {
  const RewardPage(this.reward, {super.key});
  final Reward reward;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Image.network(
                  reward.image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(reward.description,
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
                child: Text("Collect reward",
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
