import 'package:axa_casper_app/Theme/theme.dart';
import 'package:axa_casper_app/pages/home/widgets/drawer.dart';
import 'package:flutter/material.dart';

import '../../services/wallet_service.dart';
import 'package:flutter/services.dart';

class HomePageStack extends StatefulWidget {
  final List<Widget> list;
  final int initialIndex;

  HomePageStack(this.list, this.initialIndex);

  @override
  State<HomePageStack> createState() => _HomePageStackState();
}

class _HomePageStackState extends State<HomePageStack> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _selectedIndex = widget.initialIndex;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ThemeAxper.backgroundColor,
      key: scaffoldKey,
      drawerEnableOpenDragGesture: false,
      drawer: AxperDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ThemeAxper.primaryBlue,
        selectedItemColor: ThemeAxper.primaryRed,
        unselectedItemColor: ThemeAxper.white,
        selectedLabelStyle: TextStyle(fontFamily: "Publico", fontSize: 12),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, size: 22),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.rule, size: 22), label: "GOV"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_outlined, size: 22),
              label: 'Redeem'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: widget.list,
      ),
    );
  }
}
