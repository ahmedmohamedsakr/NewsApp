import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:news_app/modules/home_screen/getx/home_controller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  HomeController controller = Get.find();
  late WebViewController _webViewController;
  String url =
      "https://techcrunch.com/2022/06/17/marc-lores-food-delivery-startup-wonder-raises-350m-3-5b-valuation/";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //if I open a link insede the
      // page and not to return back to the home page but to the page which I open the link from.
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          // stay inside
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('URL'),
          actions: [
            IconButton(
              onPressed: () async {
                await _showBottomSheet(context);
              },
              icon: const Icon(
                Icons.more_horiz,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Obx(
              () => LinearProgressIndicator(
                color: controller.progress.value == 1.0
                    ? Colors.transparent
                    : Colors.blue,
                value: controller.progress.value,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            Expanded(
              child: WebView(
                initialUrl: url,
                zoomEnabled: true,
                onProgress: (value) {
                  controller.changeProgress(value);
                },
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _showBottomSheet(context) async {
    return await Get.bottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15.0, bottom: 30.0),
              width: 35.0,
              height: 5.0,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30.0)),
            ),
            const Text(
              'More Options',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            const Divider(
              thickness: 3.0,
            ),
            ListTile(
              leading: const Icon(Icons.share),
              title: const Text('Share'),
              onTap: () async {
                try {
                  await Share.share(url, subject: 'Look What I made.');
                } catch (e) {
                  _errorDialog(context, e.toString());
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.open_in_browser),
              title: const Text('Open in Browser'),
              onTap: () async {
                if (!await launchUrl(Uri.parse(url))) {
                  throw 'Could not launch $url';
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.refresh),
              title: const Text('Refresh'),
              onTap: () async {
                try {
                  try {
                    await _webViewController.reload();
                  } catch (error) {
                    print(error.toString());
                  } finally {
                    Get.back();
                  }
                } catch (e) {
                  _errorDialog(context, e.toString());
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future _errorDialog(
    BuildContext context,
    String error,
  ) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: const [
              Icon(
                IconlyBroken.danger,
                color: Colors.red,
              ),
              SizedBox(
                width: 15.0,
              ),
              Text('An error occurred'),
            ],
          ),
          content: Text(
            error,
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'ok',
              ),
            ),
          ],
        );
      },
    );
  }
}
