import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sales_erb/screens.dart';
import 'package:sales_erb/screens/drawer_navigation/drawer_navigation_screen.dart';
import 'package:sales_erb/screens/home-screen/home_screen.dart';
import 'package:sales_erb/screens/products-screen/products_screen.dart';

import '../../shared/constants/Colors.dart';
import '../../utils/theme.dart';

class MainPage extends StatefulWidget {
  final BuildContext menuScreenContext;

  const MainPage({Key? key, required this.menuScreenContext}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PersistentTabController _controller;
  late bool _hideNavBar;
  BuildContext? testContext;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      ProductsScreen(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),
      MainScreen(
        menuScreenContext: widget.menuScreenContext,
        hideStatus: _hideNavBar,
        onScreenHideButtonPressed: () {
          setState(() {
            _hideNavBar = !_hideNavBar;
          });
        },
      ),



    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Home",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shop_two),
        title: "Shop",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.view_list_sharp),
        title: ("List"),
        activeColorPrimary: Colors.teal,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => const MainScreen2(),
            '/second': (context) => const MainScreen3(),
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   color: KTextGrey2,
        //   tooltip: 'Show Snack bar',
        //   onPressed: () {},
        // ),
        title: Text(
          'Main ',
          style: heading6.copyWith(color: KTextGrey2),
        ),
        titleSpacing: 20,
        actions: [
          Row(
            children: [
              Center(
                  child: Text(
                'Sync',
                style: heading5.copyWith(color: Colors.black, fontSize: 16),
              )),
              const SizedBox(
                width: 20,
              ),
              Center(
                  child: Text(
                'Logout',
                style: heading5.copyWith(color: Colors.black, fontSize: 16),
              )),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
      drawer: DrawerNavigationScreen(),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.red,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 10.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 7.0),
        bottomScreenMargin: 60.0,

        popActionScreens: PopActionScreensType.all,
        onWillPop: (context) async {
          await showDialog(
            context: context!,
            useSafeArea: true,
            builder: (context) => Container(
              height: 50.0,
              width: 50.0,
              color: Colors.white,
              child: ElevatedButton(
                child: const Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
          return false;
        },
        selectedTabScreenContext: (context) {
          testContext = context;
        },
        hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
            colorBehindNavBar: Colors.white70,
            borderRadius: BorderRadius.circular(20.0)),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style9, // Choose the nav bar style with this property
      ),
    );
  }
}
