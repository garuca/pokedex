import 'package:flutter/services.dart';

class NativeChannel {
  static const platform = MethodChannel('com.example.pokedex/methods');

  Future<String> getNativeMessage() async {
    try {
      final String result = await platform.invokeMethod('getNativeMessage');
      return result;
    } on PlatformException catch (e) {
      return "Erro ao chamar o método nativo: '${e.message}'.";
    }
  }
}
