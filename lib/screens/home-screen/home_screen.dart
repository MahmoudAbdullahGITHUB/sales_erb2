import 'package:flutter/material.dart';
import 'package:sales_erb/screens/drawer_navigation/drawer_navigation_screen.dart';

import '../../shared/constants/Colors.dart';
import '../../utils/theme.dart';

// class HomeScreen extends StatelessWidget {
//   static const routName = '/home-screen';
//   var scaffoldKey = GlobalKey<ScaffoldState>();
//
//   HomeScreen({Key? key}) : super(key: key);
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
//                   'Sync',
//                   style: heading5.copyWith(color: Colors.black, fontSize: 16),
//                 )),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Center(
//                     child: Text(
//                   'Logout',
//                   style: heading5.copyWith(color: Colors.black, fontSize: 16),
//                 )),
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
//                         EdgeInsets.symmetric(horizontal: 40, vertical: 11.5),
//                     child: Text(
//                       'Log In',
//                       style:
//                           TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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

class HomeScreen extends StatelessWidget {
  static const routName = '/home-screen';
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;
  // var scaffoldKey = GlobalKey<ScaffoldState>();

   HomeScreen(
      {Key? key,
      required this.menuScreenContext,
      required this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: scaffoldKey,
        // appBar: AppBar(
        //   // leading: IconButton(
        //   //   icon: const Icon(Icons.menu),
        //   //   color: KTextGrey2,
        //   //   tooltip: 'Show Snack bar',
        //   //   onPressed: () {},
        //   // ),
        //   title: Text(
        //     'Main ',
        //     style: heading6.copyWith(color: KTextGrey2),
        //   ),
        //   titleSpacing: 20,
        //   actions: [
        //     Row(
        //       children: [
        //         Center(
        //             child: Text(
        //               'Sync',
        //               style: heading5.copyWith(color: Colors.black, fontSize: 16),
        //             )),
        //         const SizedBox(
        //           width: 20,
        //         ),
        //         Center(
        //             child: Text(
        //               'Logout',
        //               style: heading5.copyWith(color: Colors.black, fontSize: 16),
        //             )),
        //         const SizedBox(
        //           width: 20,
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        // drawer: DrawerNavigationScreen(),
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
        side: const BorderSide(color: Colors.white70, width: 1),
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
