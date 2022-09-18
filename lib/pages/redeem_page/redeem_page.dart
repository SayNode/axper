import 'package:axa_casper_app/models/rewards.dart';
import 'package:axa_casper_app/pages/redeem_page/widgets/reward_cart.dart';
import 'package:axa_casper_app/repositories/rewards_repo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Theme/theme.dart';

class RedeemPage extends StatefulWidget {
  const RedeemPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RedeemPage> createState() => _RedeemPageState();
}

class _RedeemPageState extends State<RedeemPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          leading: IconButton(
            icon: const Center(
              child: Icon(
                Icons.menu,
                color: ThemeAxper.white,
              ),
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              ThemeAxper.backgroundColor,
              ThemeAxper.backgroundColorDark
            ],
          )),
          child: ListView(children: [
            Container(
              padding: EdgeInsets.only(left: 10, bottom: 10),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "Redeem",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunito(
                          fontSize: 26,
                          color: ThemeAxper.textBlue,
                          fontWeight: FontWeight.w900),
                    )),
              ),
            ),
            FutureBuilder<List<Reward>>(
              future: RewardRepository.loadRewards(),
              builder: (
                BuildContext context,
                AsyncSnapshot<List<Reward>> snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(20),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return RewardCard(reward: snapshot.data![index]);
                      },
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.8,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                    );
                  } else {
                    return const Text('Empty data');
                  }
                } else {
                  return Text('State: ${snapshot.connectionState}');
                }
              },
            ),
          ]),
        ));
  }
}
