import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Theme/theme.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [ThemeAxper.backgroundColor, ThemeAxper.backgroundColorDark],
            ))),
            Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "How can I get tokens?",
                        style: GoogleFonts.nunito(
                            fontSize: 20,
                            color: ThemeAxper.textBlue,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "Through doing activties the user will be rewarded with tokens.",
                          style: GoogleFonts.nunito(
                              fontSize: 20,
                              color: ThemeAxper.textBlue,
                              fontWeight: FontWeight.w400)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "What can be done with the token?",
                        style: GoogleFonts.nunito(
                            fontSize: 20,
                            color: ThemeAxper.textBlue,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "It can be redeemed for vouchers and discount, shown on the reedem page",
                          style: GoogleFonts.nunito(
                              fontSize: 20,
                              color: ThemeAxper.textBlue,
                              fontWeight: FontWeight.w400)),
                    ),
                    
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
