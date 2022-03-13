import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sales_erb/shared/constants/Colors.dart';
import 'package:sales_erb/utils/theme.dart';


class MainScreen extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const MainScreen(
      {Key? key,
      required this.menuScreenContext,
      required this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          backgroundColor: Colors.indigo,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 30.0, vertical: 20.0),
                child: TextField(
                  decoration: InputDecoration(hintText: "Test Text Field"),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    pushNewScreenWithRouteSettings(
                      context,
                      settings: RouteSettings(name: '/home'),
                      screen: MainScreen2(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.scaleRotate,
                    );
                  },
                  child: Text(
                    "Go to Second Screen ->",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      useRootNavigator: true,
                      builder: (context) => Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Exit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Push bottom sheet on TOP of Nav Bar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      useRootNavigator: false,
                      builder: (context) => Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Exit",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Push bottom sheet BEHIND the Nav Bar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // pushDynamicScreen(context,
                    //     screen: SampleModalScreen(), withNavBar: true);
                  },
                  child: Text(
                    "Push Dynamic/Modal Screen",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    this.onScreenHideButtonPressed();
                  },
                  child: Text(
                    this.hideStatus
                        ? "Unhide Navigation Bar"
                        : "Hide Navigation Bar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(this.menuScreenContext).pop();
                  },
                  child: Text(
                    "<- Main Menu",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class HomeScreen2 extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  const HomeScreen2(
      {Key? key,
      required this.menuScreenContext,
      required this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            color: KTextGrey2,
            tooltip: 'Show Snack bar',
            onPressed: () {},
          ),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text('Welcome Client'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: buildCard('Sales Number', '0.00', Colors.green),
                    ),
                    buildCard('Sales Total', '0.00 EGP', Colors.green),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: buildCard('Paid Cost', '0.00 EGP', Colors.green),
                    ),
                    buildCard('Expected Cost', '0.00 EGP', Colors.green),
                  ],
                ),
                const Divider(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    // primary: KAppColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 40, vertical: 11.5),
                    child: Text(
                      'Log In',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ),
                const Divider(
                  height: 20,
                ),
                Card(
                  child: Container(
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        'Payment data',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, spreadRadius: 2),
                      ],
                    ),
                    height: 100,
                  ),
                ),

              ],
            ),
          ),
        ));
  }

  Card buildCard(String text1, String text2, Color cardColor) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      color: cardColor,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                text1,
                style: heading5.copyWith(color: Colors.white),
              ),
            ),
            const Divider(
              height: 5,
            ),
            Center(
              child: Text(
                text2,
                style: heading6.copyWith(
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
        width: 170,
        height: 180,
      ),
    );
  }
}

class MainScreen2 extends StatelessWidget {
  const MainScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  pushNewScreen(context, screen: MainScreen3());
                },
                child: Text(
                  "Go to Third Screen",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Go Back to First Screen",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreen3 extends StatelessWidget {
  const MainScreen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Go Back to Second Screen",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}



//
// class HomeScreen2 extends StatelessWidget {
//   static const routName = '/home-screen';
//   var scaffoldKey = GlobalKey<ScaffoldState>();
//   final BuildContext menuScreenContext;
//   final Function onScreenHideButtonPressed;
//   final bool hideStatus;
//   HomeScreen2(
//       {Key? key,
//         required this.menuScreenContext,
//         required this.onScreenHideButtonPressed,
//         this.hideStatus = false})
//       : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: scaffoldKey,
//         appBar: AppBar(
//           leading: IconButton(
//             icon: const Icon(Icons.menu),
//             color: KTextGrey2,
//             tooltip: 'Show Snack bar',
//             onPressed: () {},
//           ),
//           title: Text(
//             'Main ',
//             style: heading6.copyWith(color: KTextGrey2),
//           ),
//           titleSpacing: 20,
//           actions: [
//             Row(
//               children: [
//                 Center(
//                     child: Text(
//                       'Sync',
//                       style: heading5.copyWith(color: Colors.black, fontSize: 16),
//                     )),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Center(
//                     child: Text(
//                       'Logout',
//                       style: heading5.copyWith(color: Colors.black, fontSize: 16),
//                     )),
//                 const SizedBox(
//                   width: 20,
//                 ),
//               ],
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Center(
//                     child: Text('Welcome Client'),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Flexible(
//                       child: buildCard('Sales Number', '0.00', Colors.green),
//                     ),
//                     buildCard('Sales Total', '0.00 EGP', Colors.green),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Flexible(
//                       child: buildCard('Paid Cost', '0.00 EGP', Colors.green),
//                     ),
//                     buildCard('Expected Cost', '0.00 EGP', Colors.green),
//                   ],
//                 ),
//                 const Divider(
//                   height: 10,
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     // primary: KAppColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: const Padding(
//                     padding:
//                     EdgeInsets.symmetric(horizontal: 40, vertical: 11.5),
//                     child: Text(
//                       'Log In',
//                       style:
//                       TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                     ),
//                   ),
//                 ),
//                 const Divider(
//                   height: 20,
//                 ),
//                 Card(
//                   child: Container(
//                     width: double.infinity,
//                     child: const Center(
//                       child: Text(
//                         'Payment data',
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     ),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white,
//                       boxShadow: const [
//                         BoxShadow(color: Colors.grey, spreadRadius: 2),
//                       ],
//                     ),
//                     height: 100,
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ));
//   }
//
//   Card buildCard(String text1, String text2, Color cardColor) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         side: BorderSide(color: Colors.white70, width: 1),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       color: cardColor,
//       child: Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//               child: Text(
//                 text1,
//                 style: heading5.copyWith(color: Colors.white),
//               ),
//             ),
//             const Divider(
//               height: 5,
//             ),
//             Center(
//               child: Text(
//                 text2,
//                 style: heading6.copyWith(
//                   color: Colors.white70,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         width: 170,
//         height: 180,
//       ),
//     );
//   }
// }

