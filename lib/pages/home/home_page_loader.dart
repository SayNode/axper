import 'package:axa_casper_app/pages/home/home_page.dart';
import 'package:axa_casper_app/pages/home/home_page_stack.dart';
import 'package:axa_casper_app/pages/redeem_page/redeem_page.dart';
import 'package:flutter/material.dart';

import '../governance/governance_page.dart';

class HomePageLoader extends StatelessWidget {
  const HomePageLoader({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return HomePageStack([HomePage(), Governance(), RedeemPage()], index);
  }
}
