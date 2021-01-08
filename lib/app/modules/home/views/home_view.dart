import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:taskly/app/modules/home/controllers/home_controller.dart';
import 'package:taskly/app/theme/text_theme.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.navBarSwitcher()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 3,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: Obx(
        () => BubbleBottomBar(
          opacity: 0,
          fabLocation: BubbleBottomBarFabLocation.end,
          currentIndex: controller.currentIndex,
          backgroundColor: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          hasInk: false,
          elevation: 7,
          inkColor: Colors.black54,
          hasNotch: true,
          onTap: (index) => controller.currentIndex = index,
          items: [
            BubbleBottomBarItem(
              backgroundColor: Colors.grey,
              title: Text(
                'Home',
                style: kSub2HeadTextStyle.copyWith(fontSize: 16),
              ),
              icon: Icon(
                FontAwesomeIcons.home,
                color: Theme.of(context).primaryColorDark,
              ),
              activeIcon: Icon(FontAwesomeIcons.home,
                  color: Theme.of(context).primaryColor),
            ),
            BubbleBottomBarItem(
              backgroundColor: Colors.grey,
              title: Text(
                'Tasks',
                style: kSub2HeadTextStyle.copyWith(fontSize: 16),
              ),
              icon: Icon(
                FontAwesomeIcons.clock,
                color: Theme.of(context).primaryColorDark,
              ),
              activeIcon: Icon(FontAwesomeIcons.clock,
                  color: Theme.of(context).primaryColor),
            ),
            // BubbleBottomBarItem(
            //   backgroundColor: Colors.grey,
            //   title: Text('Settings'),
            //   icon: Icon(
            //     FontAwesomeIcons.cog,
            //     color: Theme.of(context).primaryColorDark,
            //   ),
            //   activeIcon: Icon(FontAwesomeIcons.cog,
            //       color: Theme.of(context).primaryColor),
            // ),
          ],
        ),
      ),
    );
  }
}