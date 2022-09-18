import 'package:axa_casper_app/pages/home/home_page_loader.dart';
import 'package:flutter/material.dart';

final String testUsername = 'hans';
final String tesPassword = '12345678';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 160,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(fillColor: Colors.green, filled: true),
              controller: usernameController,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration:
                  const InputDecoration(fillColor: Colors.green, filled: true),
              obscureText: true,
              controller: passwordController,
            ),
            ElevatedButton(
                onPressed: () {
                  if (usernameController.text == testUsername &&
                      passwordController.text == tesPassword) {
                    print('login');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePageLoader(index: 0,)),
                    );
                  } else {
                    print('wrong login data');
                  }
                },
                child: const Text('Login')),
          ],
        ),
      ),
    );
  }
}
