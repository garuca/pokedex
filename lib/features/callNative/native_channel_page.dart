import 'package:flutter/material.dart';
import 'package:pokedex/features/callNative/native_channel.dart';

class NativeChannelPage extends StatefulWidget {
  const NativeChannelPage({super.key});

  @override
  _NativeChannelPageState createState() => _NativeChannelPageState();
}

class _NativeChannelPageState extends State<NativeChannelPage> {
  String _nativeMessage = 'Esperando mensagem...';

  @override
  void initState() {
    super.initState();
    _getNativeMessage();
  }

  Future<void> _getNativeMessage() async {
    String message = await NativeChannel().getNativeMessage();
    setState(() {
      _nativeMessage = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(_nativeMessage),
      ),
    );
  }
}