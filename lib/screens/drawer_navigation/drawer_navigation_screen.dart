import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/constants/Colors.dart';
import 'drawer_body.dart';
import 'header.dart';

class DrawerNavigationScreen extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 16);

  // static var dividerColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height;
    final color = Colors.black;
    final hoverColor = Colors.white70;
    final dividerColor = KDividerColor;

    return Drawer(
      child: Material(
        // color: HexColor("#ffD300"),
        color: KAppDrawerColor,
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Header(),
            ),
            Expanded(
              flex: 4,
              child: DrawerBody(
                  padding: padding,
                  color: color,
                  hoverColor: hoverColor,
                  height: height,
                  width: width,
                  dividerColor: dividerColor),
            ),
          ],
        ),
      ),
    );
  }
}

// buildMenuItem(
//   title: 'Main Page',
//   icon: Icons.home,
//   onTabb: () => print("height === $height + $width"),
// ),

// buildMenuItem(title: 'Orders', icon: Icons.bookmark_border),

// buildMenuItem(title: 'Log in', icon: Icons.login),

// buildMenuItem(title: 'Profile', icon: Icons.person_sharp),

// buildMenuItem(
//     title: 'Shipping Cart',
//     icon: Icons.shopping_cart_outlined),

// buildMenuItem(title: 'Contact us', icon: Icons.call),

// Column buildMenuItem({
//   required String title,
//   required IconData icon,
//   VoidCallback? onTabb,
// }) {
//   final color = Colors.black;
//   final hoverColor = Colors.white70;
//   final dividerColor = Colors.white70;
//   return Column(
//     children: [
//       ListTile(
//         leading: Icon(
//           icon,
//           color: color,
//         ),
//         title: Text(
//           title,
//           style: TextStyle(color: color,),
//         ),
//         hoverColor: hoverColor,
//         onTap: onTabb,
//       ),
//       Divider(color: dividerColor,),
//
//     ],
//   );
// }
