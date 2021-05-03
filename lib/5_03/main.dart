import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WebViewController _webViewController;



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool canGoBack = await _webViewController.canGoBack();
        if (canGoBack) {
          _webViewController.goBack();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(''),
        ),
        body: WebView(
          initialUrl: 'https://m.naver.com/',
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: Text('loadUrl'),
              onPressed: () {
                _webViewController.loadUrl('https://survivalcoding.com');
              },
            ),
            FloatingActionButton(
              child: Text('goBack'),
              onPressed: () async {
                bool canGoBack = await _webViewController.canGoBack();
                if (canGoBack) {
                  _webViewController.goBack();
                }

                // _webViewController.canGoBack().then((value) {
                //   if (value) {
                //     _webViewController.goBack();
                //   }
                // });
              },
            ),
          ],
        ),
      ),
    );
  }
}
