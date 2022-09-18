import 'package:axa_casper_app/pages/governance/widgets/request_card.dart';
import 'package:axa_casper_app/pages/governance/widgets/request_listview.dart';
import 'package:axa_casper_app/repositories/request_repo.dart';
import 'package:axa_casper_app/utils/request_stream.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Theme/theme.dart';
import '../../models/request_model.dart';

class Governance extends StatefulWidget {
  const Governance({
    Key? key,
  }) : super(key: key);

  @override
  State<Governance> createState() => _Governance();
}

class _Governance extends State<Governance>
    with SingleTickerProviderStateMixin {
  late List<Widget> items = [];

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: TabBar(
            tabs: [Text("Pending", style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: ThemeAxper.textBlue,
                        fontWeight: FontWeight.w500),), Text("Done", style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: ThemeAxper.textBlue,
                        fontWeight: FontWeight.w500),), Text("Denied", style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: ThemeAxper.textBlue,
                        fontWeight: FontWeight.w500),)],
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              ThemeAxper.backgroundColor,
              ThemeAxper.backgroundColorDark
            ],
          )),
          child: StreamBuilder<List<Request>>(
            stream: checkRequests(1),
            builder: (
              BuildContext context,
              AsyncSnapshot<List<Request>> snapshot,
            ) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.active) {
                print('done');
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  return TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      //Sent Tx
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: RequestListview(
                            status: 'pending', requests: snapshot.data!),
                      ),
                      //Recieved Tx
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: RequestListview(
                            status: 'done', requests: snapshot.data!),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: RequestListview(
                            status: 'denied', requests: snapshot.data!),
                      ),
                    ],
                  );
                } else {
                  return const Text('Empty data');
                }
              } else {
                return Center(child: Text('State: ${snapshot.connectionState}'));
              }
            },
          ),
        ),
      ),
    );
  }
}
