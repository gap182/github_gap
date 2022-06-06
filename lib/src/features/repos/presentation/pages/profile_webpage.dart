import 'package:flutter/material.dart';
import 'package:github_gap/src/core/utils/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProfileWebpage extends StatelessWidget {
  const ProfileWebpage({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(context, true),
      body: WebView(
        initialUrl: Uri.encodeFull(url),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
