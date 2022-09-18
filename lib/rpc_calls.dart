import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:axa_casper_app/utils/key_utils.dart';
import 'package:convert/convert.dart';
import 'package:casper_dart_sdk/casper_dart_sdk.dart';
import 'package:thor_devkit_dart/crypto/blake2b.dart';

doStuff2() async {
  File pemFile = File('C:/Users/SayNode/Documents/GitHub/axa_casper_app/assets/pem.pem');
  var ip = '52.70.214.247:7777';
  final client = CasperClient(Uri.parse("http://$ip/rpc"));
  var deploy = Deploy.contractCall(
      'erc20_token_contract',
      'balance_of',
      [
        NamedArg(
            'address',
            ClValue.u256(BigInt.parse(
                '0xabfa43e368e0064297853e9a9efa0d059bc1a850ad6464c7008d088a9126164d')))
      ],
      ClPublicKey.fromHex(
          '0202564234caad4a38a93fccfb26d82b87571ad3d3ce16974fc9ca5586e9422d7dd9'),
      BigInt.zero,
      'casper-test');
      
      deploy.sign(await Secp256k1KeyPair.loadFromPem(pemFile));
  var balance = await client.putDeploy(deploy);
  return balance.deployHash;
}

doStuff() async {
  var ip = '52.70.214.247:7777';
  final client = CasperClient(Uri.parse("http://$ip/rpc"));
  var res = await client.getDictionaryItemByUref(Uref('uref-b548d3c9895fabaec4949c4c2de130996062dad136aa5543126a7dbe4463ba38-007'), namedKey('0202564234caad4a38a93fccfb26d82b87571ad3d3ce16974fc9ca5586e9422d7dd9'));
  var value = res.storedValue as ClValue;
  return value.parsed;
}