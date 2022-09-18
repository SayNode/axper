import 'package:axa_casper_app/Theme/theme.dart';
import 'package:axa_casper_app/models/activities.dart';
import 'package:axa_casper_app/pages/faq_page.dart';
import 'package:axa_casper_app/pages/home/widgets/activites_card.dart';
import 'package:axa_casper_app/pages/home/widgets/drawer.dart';
import 'package:axa_casper_app/repositories/activites_repo.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/wallet_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      drawer: AxperDrawer(),
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: AppBar(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: ThemeAxper.primaryBlue,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Center(
                        child: Icon(
                          Icons.menu,
                          color: ThemeAxper.white,
                        ),
                      ),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                    Center(
                        child: Container(
                      width: 80,
                      child: Image(
                        image: AssetImage("lib/assets/images/logo.png"),
                      ),
                    )),
                    IconButton(
                      icon: const Center(
                        child: Icon(
                          Icons.question_mark,
                          color: ThemeAxper.white,
                        ),
                      ),
                      onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FAQ()),
                    )
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: StreamBuilder<BigInt>(
                        //initialData: 0.0,
                        stream: WalletService.checkBalanceStream(1),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return Container(
                                  margin: EdgeInsets.all(10),
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: ThemeAxper.textBlue,
                                  ));
                            default:
                              if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                final balance = snapshot.data.toString();

                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  height: 40,
                                  child: Center(
                                    child: Text(balance,
                                        style: TextStyle(
                                            color: ThemeAxper.textBlue,
                                            fontSize: 18)),
                                  ),
                                );
                              }
                          }
                        },
                      ),
                    ),
                    Container(
                        width: 20,
                        child: Image(
                            image:
                                AssetImage("lib/assets/images/coin_inv.png"))),
                  ],
                )
              ],
            ),
          ),
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          automaticallyImplyLeading: false,
          elevation: 10,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  ThemeAxper.backgroundColor,
                  ThemeAxper.backgroundColorDark
                ],
              )),
              child: FutureBuilder<String>(
                future:
                    rootBundle.loadString('lib/assets/data/activities.json'),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<String> snapshot,
                ) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return const Text('Error');
                    } else if (snapshot.hasData) {
                      return Center(
                          child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Hi Werner",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: "Publico",
                                  color: ThemeAxper.textBlue),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "Click on the activity to start it",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Publico",
                                  color: ThemeAxper.textBlue),
                            ),
                          ),
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Individual",
                                style: GoogleFonts.nunito(
                                    fontSize: 20,
                                    color: ThemeAxper.textBlue,
                                    fontWeight: FontWeight.w900),
                              )),
                          carousell(snapshot.data!, 1),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Group",
                                style: GoogleFonts.nunito(
                                    fontSize: 20,
                                    color: ThemeAxper.textBlue,
                                    fontWeight: FontWeight.w900),
                              )),
                          carousell(snapshot.data!, 2),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Coorporate",
                                style: GoogleFonts.nunito(
                                    fontSize: 20,
                                    color: ThemeAxper.textBlue,
                                    fontWeight: FontWeight.w900),
                              )),
                          carousell(snapshot.data!, 3),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ));
                    } else {
                      return const Text('Empty data');
                    }
                  } else {
                    return Text('State: ${snapshot.connectionState}');
                  }
                },
              )),
        ),
      ),
    );
  }

  carousell(String json, int group) {
    return CarouselSlider(
      options: CarouselOptions(
        padEnds: false,
        height: 200,
        pageSnapping: false,
        viewportFraction: 0.4,
        enableInfiniteScroll: false,
      ),
      items: getCarrouselItems(json, group),
    );
  }

  List<Widget> getCarrouselItems(String json, int group) {
    List<Widget> items = [];
    for (Activites prod in ActivitesRepo.loadActivites(json)) {
      if (prod.group == group) {
        items.add(ActivityCard(prod));
      }
    }
    return items;
  }
}
