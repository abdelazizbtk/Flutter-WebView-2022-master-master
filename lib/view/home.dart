import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  late WebViewController controller;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          //backgroundColor: Color(0xFF0071A9),
          height: 60,
          destinations: [
            NavigationDestination(
              icon: InkWell(
                onTap: () {
                  controller.loadUrl('https://app.ilovebrescia.it/');
                },
                child: Container(
                  child: Icon(Icons.home),
                ),
              ),
              label: 'ITA',
            ),
            NavigationDestination(
              icon: InkWell(
                onTap: () {
                  controller.loadUrl(
                      'https://app.ilovebrescia.it/es/bgbs23-espanol/');
                },
                child: Container(
                  child: Icon(Icons.home),
                ),
              ),
              label: 'ESP',
            ),
            NavigationDestination(
              icon: InkWell(
                onTap: () {
                  controller.loadUrl(
                      'https://app.ilovebrescia.it/de/bgbs23-deutsch/');
                },
                child: Container(
                  child: Icon(Icons.home),
                ),
              ),
              label: 'DEU',
            ),
            NavigationDestination(
              icon: InkWell(
                onTap: () {
                  controller.loadUrl(
                      'https://app.ilovebrescia.it/en/bgbs23-english/');
                },
                child: Container(
                  child: Icon(Icons.home),
                ),
              ),
              label: 'ENG',
            ),
          ],
        ),
        body: SafeArea(
          child: Stack(
            children: [
              WebView(
                initialUrl: 'https://app.ilovebrescia.it/',
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (controller) {
                  this.controller = controller;
                },
                onPageStarted: (url) {
                  print('page Started : $url');
                  setState(() {
                    isLoading = false;
                  });
                },
                onPageFinished: (url) {
                  print('finished');
                },
              ),
              if (isLoading)
                const Center(
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(),
                  ),
                )
            ],
          ),
        ));
  }
}
