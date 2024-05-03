import 'package:encrypt/encrypt.dart' ;
class Security{
  static const encryptionKey = "2v5M6wdt8Hqf1fzR5WYRrb6RopQxePB2xky+Ccc7+OU=";

  static const encryptionIV = "Hkald6sksljusk9n";


  static encryptData(String text) {
    print("encryytKey: "+encryptionKey);
    final key = Key.fromBase64(encryptionKey);

    final iv = IV.fromBase64(encryptionIV);

    final encrypter =
    Encrypter(AES(key , padding:  EncryptionModes.AESPADDING));

    final encrypted = encrypter.encrypt(text, iv: iv);

    return encrypted.base64;
  }
 static String decryptData(String text) {
    final key = Key.fromBase64(encryptionKey);

    final iv = IV.fromBase64(encryptionIV);

    final encrypter =
    Encrypter(AES(key,padding: EncryptionModes.AESPADDING));

    final decrypted = encrypter.decrypt(Encrypted.from64(text), iv: iv);

    return decrypted;
  }
}
class EncryptionModes {

  static const CBC = "AESMode.cbc";

  static const CFB64 = "AESMode.cfb64";

  static const CTR = "AESMode.ctr";

  static const ECB = "AESMode.ecb";

  static const OFB64GCTR = "AESMode.ofb64Gctr";

  static const OFB64 = "AESMode.ofb64";

  static const SIC = "AESMode.sic";

  static const PADDING = "PKCS7";

  static const ENCRYPTION_IV = "";

  static const AESPADDING = "PKCS7";


}
