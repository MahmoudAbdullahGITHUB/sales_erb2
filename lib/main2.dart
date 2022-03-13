import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sales_erb/screens.dart';
import 'package:sales_erb/screens/home-screen/home_screen.dart';
import 'package:sales_erb/utils/theme.dart';

void main() {
  runApp(const MyApp());
}
BuildContext? testContext;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      // theme: ThemeData(
      //   primarySwatch: Colors.blue,
      // ),
      home: ProvidedStylesExample(menuScreenContext: context),
      routes: {
        // HomeScreen.routName: (_) => HomeScreen(),
      },
    );
  }
}



class ProvidedStylesExample extends StatefulWidget {
  final BuildContext menuScreenContext;
  const ProvidedStylesExample({Key? key, required this.menuScreenContext}) : super(key: key);

  @override
  _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
}

class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [

      HomeScreen2(
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
      MainScreen(
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
        icon: const Icon(Icons.search),
        title: ("Search"),
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
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.add),
          title: ("Add"),
          activeColorPrimary: Colors.blueAccent,
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.white,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: '/',
            routes: {
              '/first': (context) => const MainScreen2(),
              '/second': (context) => const MainScreen3(),
            },
          ),
          onPressed: (context) {
            // pushDynamicScreen(context!,
            //     screen: SampleModalScreen(), withNavBar: true);
          }),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.message),
        title: ("Messages"),
        activeColorPrimary: Colors.deepOrange,
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            '/first': (context) => const MainScreen2(),
            '/second': (context) => const MainScreen3(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ("Settings"),
        activeColorPrimary: Colors.indigo,
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
      appBar: AppBar(title: const Text('Navigation Bar Demo')),
      drawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is the Drawer'),
            ],
          ),
        ),
      ),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
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
            colorBehindNavBar: Colors.indigo,
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


//
// class MainMenu extends StatefulWidget {
//   const MainMenu({Key? key}) : super(key: key);
//
//   @override
//   _MainMenuState createState() => _MainMenuState();
// }
//
// class _MainMenuState extends State<MainMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Sample Project"),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           // Center(
//           //   child: ElevatedButton(
//           //     child: Text("Custom widget example"),
//           //     onPressed: () => pushNewScreen(
//           //       context,
//           //       screen: CustomWidgetExample(
//           //         menuScreenContext: context,
//           //       ),
//           //     ),
//           //   ),
//           // ),
//           const SizedBox(height: 20.0),
//           Center(
//             child: ElevatedButton(
//               child: const Text("Built-in styles example"),
//               onPressed: () => pushNewScreen(
//                 context,
//                 screen: ProvidedStylesExample(
//                   menuScreenContext: context,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//



//
// class CustomWidgetExample extends StatefulWidget {
//   final BuildContext menuScreenContext;
//   CustomWidgetExample({Key? key, required this.menuScreenContext}) : super(key: key);
//
//   @override
//   _CustomWidgetExampleState createState() => _CustomWidgetExampleState();
// }
//
// class _CustomWidgetExampleState extends State<CustomWidgetExample> {
//   late PersistentTabController _controller;
//   late bool _hideNavBar;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = PersistentTabController(initialIndex: 0);
//     _hideNavBar = false;
//   }
//
//   List<Widget> _buildScreens() {
//     return [
//       MainScreen(
//         menuScreenContext: widget.menuScreenContext,
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar;
//           });
//         },
//       ),
//       MainScreen(
//         menuScreenContext: widget.menuScreenContext,
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar;
//           });
//         },
//       ),
//       MainScreen(
//         menuScreenContext: widget.menuScreenContext,
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar;
//           });
//         },
//       ),
//       MainScreen(
//         menuScreenContext: widget.menuScreenContext,
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar;
//           });
//         },
//       ),
//       MainScreen(
//         menuScreenContext: widget.menuScreenContext,
//         hideStatus: _hideNavBar,
//         onScreenHideButtonPressed: () {
//           setState(() {
//             _hideNavBar = !_hideNavBar;
//           });
//         },
//       ),
//     ];
//   }
//
//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     return [
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.home),
//         title: "Home",
//         activeColorPrimary: Colors.blue,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.search),
//         title: ("Search"),
//         activeColorPrimary: Colors.teal,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.add),
//         title: ("Add"),
//         activeColorPrimary: Colors.deepOrange,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.settings),
//         title: ("Settings"),
//         activeColorPrimary: Colors.indigo,
//         inactiveColorPrimary: Colors.grey,
//       ),
//       PersistentBottomNavBarItem(
//         icon: Icon(Icons.settings),
//         title: ("Settings"),
//         activeColorPrimary: Colors.indigo,
//         inactiveColorPrimary: Colors.grey,
//       ),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Navigation Bar Demo')),
//       drawer: Drawer(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               const Text('This is the Drawer'),
//             ],
//           ),
//         ),
//       ),
//       body: PersistentTabView.custom(
//         context,
//         controller: _controller,
//         screens: _buildScreens(),
//         confineInSafeArea: true,
//         itemCount: 5,
//         handleAndroidBackButtonPress: true,
//         stateManagement: true,
//         hideNavigationBar: _hideNavBar,
//         screenTransitionAnimation: ScreenTransitionAnimation(
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 200),
//         ),
//         customWidget: CustomNavBarWidget(
//           items: _navBarsItems(),
//           onItemSelected: (index) {
//             setState(() {
//               _controller.index = index; // THIS IS CRITICAL!! Don't miss it!
//             });
//           },
//           selectedIndex: _controller.index,
//         ),
//       ),
//     );
//   }
// }


//
// class CustomNavBarWidget extends StatelessWidget {
//   final int selectedIndex;
//   final List<PersistentBottomNavBarItem> items;
//   final ValueChanged<int> onItemSelected;
//
//   CustomNavBarWidget({
//     Key? key,
//     required this.selectedIndex,
//     required this.items,
//     required this.onItemSelected,
//   });
//
//   Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
//     return Container(
//       alignment: Alignment.center,
//       height: kBottomNavigationBarHeight,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Flexible(
//             child: IconTheme(
//               data: IconThemeData(
//                   size: 26.0,
//                   color: isSelected
//                       ? (item.activeColorSecondary == null
//                       ? item.activeColorPrimary
//                       : item.activeColorSecondary)
//                       : item.inactiveColorPrimary == null
//                       ? item.activeColorPrimary
//                       : item.inactiveColorPrimary),
//               child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 5.0),
//             child: Material(
//               type: MaterialType.transparency,
//               child: FittedBox(
//                   child: Text(
//                     item.title!,
//                     style: TextStyle(
//                         color: isSelected
//                             ? (item.activeColorSecondary == null
//                             ? item.activeColorPrimary
//                             : item.activeColorSecondary)
//                             : item.inactiveColorPrimary,
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12.0),
//                   )),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Container(
//         width: double.infinity,
//         height: kBottomNavigationBarHeight,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: items.map((item) {
//             int index = items.indexOf(item);
//             return Flexible(
//               child: GestureDetector(
//                 onTap: () {
//                   this.onItemSelected(index);
//                 },
//                 child: _buildItem(item, selectedIndex == index),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }
//

// ----------------------------------------- Provided Style ----------------------------------------- //
