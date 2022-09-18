
import 'dart:convert';
import 'dart:typed_data';

import 'package:casper_dart_sdk/casper_dart_sdk.dart';
import 'package:thor_devkit_dart/crypto/blake2b.dart';

String namedKey(String pubKey) {
  ClPublicKey key = ClPublicKey.fromHex(pubKey);
  var result = base64Encode(toAccountHash(key.bytes));
  return result;
}

  Uint8List toAccountHash(Uint8List data) {
    var separator = Uint8List.fromList([0]);
    var prefix = Uint8List.fromList([
      ...[115, 101, 99, 112, 50, 53, 54, 107, 49],
      ...separator,
    ]);

    if (data.isEmpty) {
      return Uint8List.fromList([]);
    } else {
      return Uint8List.fromList(Uint8List.fromList([0])+byteHash(Uint8List.fromList([...prefix, ...data])));
    }
  }

  Uint8List byteHash(Uint8List x) {
  
  return blake2b256([x]);
}