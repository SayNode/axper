import 'dart:convert';

import 'package:axa_casper_app/rpc_calls.dart';
import 'package:axa_casper_app/services/wallet_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('test rpc', () async {
    var a = await doStuff();
    print(a);
  });
  test('test check balance', () async {
    await WalletService.checkBalance();
  });

    test('test transfer', () async {
    var a = await WalletService.transferToken('0202564234caad4a38a93fccfb26d82b87571ad3d3ce16974fc9ca5586e9422d7dd9', '3');
    print(a);
  });
}
