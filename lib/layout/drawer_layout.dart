import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/modules/home_screen/getx/home_controller.dart';

class DrawerLayout extends StatelessWidget {
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/images/newspaper.png',
                      width: 60.0,
                      height: 60.0,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Flexible(
                    child: Text(
                      'News App',
                      style: GoogleFonts.lobster(
                        fontSize: 20.0,
                        letterSpacing: .6,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home_filled,
              ),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 20.0),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.bookmark,
              ),
              title: Text(
                'Home',
                style: TextStyle(fontSize: 20.0),
              ),
              onTap: () {},
            ),
            const Divider(
              thickness: 3.0,
            ),
            SwitchListTile(
              value: controller.isDark,
              onChanged: (value) {
                controller.changeTheme(context);
              },
              title: Text(
                controller.isDark ? "Dark" : "Light",
                style: TextStyle(fontSize: 20.0),
              ),
              secondary: Icon(
                controller.isDark ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Row(
            //     children: [
            //       Icon(
            //         controller.isDark ? Icons.dark_mode : Icons.light_mode,
            //         color: Theme.of(context).colorScheme.secondary,
            //       ),
            //       const SizedBox(
            //         width: 15.0,
            //       ),
            //       Expanded(
            //         child: Text(controller.isDark ? "Dark" : "Light"),
            //       ),
            //       Switch(
            //         value: controller.isDark,
            //         onChanged: (value) {
            //           controller.changeTheme(context);
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
