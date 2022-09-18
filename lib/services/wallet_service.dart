import 'dart:io';
import 'package:casper_sdk/erc20-client/erc20_client.dart' as erc20;
import 'package:casper_dart_sdk/casper_dart_sdk.dart';
import 'package:casper_sdk/classes/keys.dart' as keys;
import 'package:casper_sdk/casper_dart_sdk.dart' as sdk;
import '../utils/globals.dart';
import '../utils/key_utils.dart';
import 'package:casper_sdk/classes/CLValue/public_key.dart' as cl;

class WalletService {
  static Stream<BigInt> checkBalanceStream(int intervalInSeconds) =>
      Stream.periodic(Duration(seconds: intervalInSeconds))
          .asyncMap((_) => checkTokenBalance());

  static Future<BigInt> checkBalance() async {
    final client = CasperClient(Uri.parse("http://$ip/rpc"));
    var accountInfo =
        await client.getAccountInfo(ClPublicKey.fromHex(publicKey));
    var uref = accountInfo.account.mainPurse;
    var balance = await client.getBalance(uref);
    return balance.balanceValue;
  }

  static Future<BigInt> checkTokenBalance() async {
    final client = CasperClient(Uri.parse("http://$ip/rpc"));
    var res = await client.getDictionaryItemByUref(
        Uref(
            'uref-b548d3c9895fabaec4949c4c2de130996062dad136aa5543126a7dbe4463ba38-007'),
        namedKey(
            '0202564234caad4a38a93fccfb26d82b87571ad3d3ce16974fc9ca5586e9422d7dd9'));
    var value = res.storedValue as ClValue;
    return BigInt.parse(value.parsed);
  }

  static Future<String> transferToken(String to, String amount) async {
    var erc20Client =
        erc20.ERC20Client("http://$ip/rpc", "casper-test", "http://$ip");
    erc20Client.contractHash =
        '28220020f03b9a0f2c9a223ef8a0a8a63b0f60530fd7942a1eae941043c46351';

        

    String priv = """-----BEGIN EC PRIVATE KEY-----
MHQCAQEEIPCVTMUBQMu7QebyvlYhGLDCyEY9y3YDPpLnjyFTo7M7oAcGBSuBBAAK
oUQDQgAEVkI0yq1KOKk/zPsm2CuHVxrT084Wl0/JylWG6UItfdmhligEu/ohrGkB
3vTWg96cX7p/AIiVIjD0wnom/acx8A==
-----END EC PRIVATE KEY-----""";
    var res = await erc20Client.transfer(
        keys.Secp256K1.loadKeyPairFromPrivateFile(priv),
        cl.CLPublicKey.fromHex(to),
        amount,
        '1000000000');
    print(res);
    return res;
  }
}
