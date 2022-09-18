import 'package:axa_casper_app/pages/redeem_page/reward_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Theme/theme.dart';
import '../../../models/rewards.dart';

class RewardCard extends StatefulWidget {
  const RewardCard({super.key, required this.reward});
  final Reward reward;

  @override
  State<RewardCard> createState() => _RewardCardState();
}

class _RewardCardState extends State<RewardCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RewardPage(widget.reward)),
        );
      },
      child: Container(
        height: 300,
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
                  widget.reward.image,
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
                    Text(widget.reward.title,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(
                            fontSize: 12,
                            color: ThemeAxper.textBlue,
                            fontWeight: FontWeight.w600)),
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
