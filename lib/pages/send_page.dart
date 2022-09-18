import 'package:axa_casper_app/Theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          elevation: 0.0,
          toolbarHeight: 40,
        ),
        body: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                ThemeAxper.backgroundColor,
                ThemeAxper.backgroundColorDark
              ],
            ))),
            Column(
              children: [
                Container(
                  color: Theme.of(context).primaryColor,
                  height: 50,
                  child: Row(
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
                                  child: const CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.red,
                                  ));
                            default:
                              if (snapshot.hasError) {
                                return Text(snapshot.error.toString());
                              } else {
                                final balance = snapshot.data.toString();

                                return Text(balance,
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.white));
                              }
                          }
                        },
                      ),
                      Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: 20,
                          child: const Image(
                              image: AssetImage(
                                  "lib/assets/images/coin_inv.png"))),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    "Send amount",
                    style: GoogleFonts.nunito(
                        fontSize: 20,
                        color: ThemeAxper.textBlue,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: GoogleFonts.nunito(
                        fontSize: 16,
                        color: ThemeAxper.textBlue,
                        fontWeight: FontWeight.w800),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: ThemeAxper.textBlue)
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: ThemeAxper.textBlue)
                      ),
                      hintText: "Receiver's Address",
                      hintStyle: GoogleFonts.nunito(
                        fontSize: 16,
                        color: ThemeAxper.textBlue,
                        fontWeight: FontWeight.w800),
                    ),
                    controller: addressController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: GoogleFonts.nunito(
                        fontSize: 16,
                        color: ThemeAxper.textBlue,
                        fontWeight: FontWeight.w800),
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: ThemeAxper.textBlue)
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: ThemeAxper.textBlue)
                      ),
                      hintText: 'Amount',
                      hintStyle: GoogleFonts.nunito(
                        fontSize: 16,
                        color: ThemeAxper.textBlue,
                        fontWeight: FontWeight.w800),
                    ),
                    controller: valueController,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ThemeAxper.primaryBlue), shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                    onPressed: () async {
                      onLoading(context);
                      var res = await WalletService.transferToken(
                          addressController.text, valueController.text);
                      Navigator.pop(context);
                      _txConfirmedAlert(context, res);
                    },
                    child: Text('Confirm transaction', style: GoogleFonts.nunito(
                        fontSize: 16,
                        color: ThemeAxper.textBlue,
                        fontWeight: FontWeight.w800),)),
              ],
            ),
          ],
        ));
  }

  _txConfirmedAlert(BuildContext context, String txId) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Transction Successful"),
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
                  const CircularProgressIndicator(),
                  const SizedBox(
                    height: 15,
                  ),
                  // Some text
                  const Text('Loading...')
                ],
              ),
            ));
      },
    );
  }
}
