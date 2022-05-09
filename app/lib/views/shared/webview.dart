import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/mfg_labs_icons.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../helpers/session.dart';
import '../../helpers/static-data.dart';
import '../../helpers/utilities.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }



  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DefaultColors.dark,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Entypo.left_open),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Entypo.logout),
            onPressed: () async {
              await Logout();
              Navigator.pushNamed(context, '/login');
            },
          )
        ],
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: widget.url,
          allowsInlineMediaPlayback: true,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
