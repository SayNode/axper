import 'package:axa_casper_app/Theme/theme.dart';
import 'package:axa_casper_app/pages/faq_page.dart';
import 'package:axa_casper_app/pages/home/home_page.dart';
import 'package:axa_casper_app/pages/home/home_page_loader.dart';
import 'package:axa_casper_app/pages/send_page.dart';
import 'package:axa_casper_app/pages/settings_page.dart';
import 'package:flutter/material.dart';

class AxperDrawer extends StatelessWidget {
  AxperDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade200,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("lib/assets/images/Me.jpg"),
                radius: 35.0,
              ),
              const SizedBox(
                width: 10,
                height: 100,
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 8, right: 0, top: 8, bottom: 8),
                child: Text(
                  'Werner Liechti',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: "Publico",
                      fontSize: 20,
                      color: ThemeAxper.primaryBlue),
                ),
              )
            ],
          ),
          const Divider(
            color: ThemeAxper.primaryBlue,
            thickness: 2,
          ),
          Material(
            type: MaterialType.transparency,
            child: ListTile(
              leading: const Icon(Icons.home_outlined),
              title: Text(
                'Home',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePageLoader(index: 0,)),
                );
              },
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: ListTile(
              leading: const Icon(
                Icons.settings_outlined,
              ),
              title: Text(
                'Settings',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: ListTile(
              leading: const Icon(
                Icons.currency_exchange,
              ),
              title: Text(
                'Send',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SendPage()),
                );
              },
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: ListTile(
              leading: const Icon(
                Icons.question_mark_rounded,
              ),
              title: Text(
                'FAQ',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FAQ()),
                ),
            ),
          ),
          const Divider(
            color: ThemeAxper.primaryBlue,
            thickness: 2,
          ),
          const SizedBox(height: 10),
          Expanded(child: Container()),
          Material(
            type: MaterialType.transparency,
            child: ListTile(
                leading: const Icon(Icons.logout_rounded,
                    color: ThemeAxper.primaryRed),
                title: Text(
                  'Logout',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                onTap: null),
          ),
        ]),
      ),
    );
  }
}
