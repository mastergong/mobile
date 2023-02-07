import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'core/local/key_value_storage_base.dart';

class AuthenCoop {
  static Future<String> checkAPPForPSUCOOP() async {
    await dotenv.load(
      fileName: "assets/.env",
    );

    String coopCode = dotenv.env["COOP"].toString();

    if (coopCode.toUpperCase() == "PSUCOOP") {
      return '0001';
    } else {
      return '';
    }
  }

  static Future<String> getCoopCodeFromDeVice() async {
    try {
      String coopCode = await KeyValueStorageBase().getCoopCoden();
      return coopCode;
    } catch (e) {
      return '';
    }
  }

  static Future<String> mainStartInit() async {
    String coopCode = '';

    coopCode = await checkAPPForPSUCOOP().then((value) async {
      if (value.isEmpty) {
        value = await getCoopCodeFromDeVice();
      }
      return value;
    });

    return coopCode;
  }
}
