import 'package:axa_casper_app/Theme/theme.dart';
import 'package:flutter/material.dart';

import '../services/wallet_service.dart';

class SendPage extends StatefulWidget {
  const SendPage({Key? key}) : super(key: key);

  @override
  State<SendPage> createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  final addressController = TextEditingController();
  final valueController = TextEditingController();

  updateAddress(String address) {
    setState(() => addressController.text = address);
  }

  @override
  void dispose() {
    valueController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawerEnableOpenDragGesture: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 90,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<BigInt>(
                stream: WalletService.checkBalanceStream(1),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Container(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.red,
                          ));
                    default:
                      if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      } else {
                        final balance = snapshot.data.toString();

                        return Text(balance, style: TextStyle(fontSize: 16));
                      }
                  }
                },
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 20,
                  child: Image(
                      image: AssetImage("lib/assets/images/coin_inv.png"))),
            ],
          ),
        ),
        body: Column(
          children: [
            Material(
              type: MaterialType.transparency,
              child: ListTile(
                leading: const Icon(
                  Icons.qr_code,
                ),
                title: Text(
                  'Scan QRCode',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                onTap: () {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Receiver's Address",
                ),
                controller: addressController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Amount',
                ),
                controller: valueController,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  onLoading(context);
                  var res = await WalletService.transferToken(
                      addressController.text, valueController.text);
                  Navigator.pop(context);
                  _txConfirmedAlert(context, res);
                },
                child: Text('Send')),
          ],
        ));
  }

  _txConfirmedAlert(BuildContext context, String txId) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Transction Successful"),
      content: Text("Transaction ID: \n" + txId),
      actions: [
        cancelButton,
      ],
    );
    // show the dialog
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  onLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // The loading indicator
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  // Some text
                  Text('Loading...')
                ],
              ),
            ));
      },
    );
  }
}
