import 'package:flutter/material.dart';

import 'drawer_item.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({
    Key? key,
    required this.padding,
    required this.color,
    required this.hoverColor,
    required this.height,
    required this.width,
    required this.dividerColor,
  }) : super(key: key);

  final EdgeInsets padding;
  final Color color;
  final Color hoverColor;
  final double height;
  final double width;
  final Color dividerColor;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding,
      children: [
        const SizedBox(
          height: 20,
        ),
        DrawerItem(
          color: color,
          hoverColor: hoverColor,
          height: height,
          width: width,
          dividerColor: dividerColor,
          itemIcon: Icons.language,
          title: 'Arabic',
          onTab: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomeScreen()),
            // );
          },
        ),
        DrawerItem(
          color: color,
          hoverColor: hoverColor,
          height: height,
          width: width,
          dividerColor: dividerColor,
          itemIcon: Icons.money,
          title: 'Expenses',
          onTab: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ShippingCart()),
            // );
          },
        ),
        DrawerItem(
          color: color,
          hoverColor: hoverColor,
          height: height,
          width: width,
          dividerColor: dividerColor,
          itemIcon: Icons.monetization_on_outlined,
          title: 'Clients payment',
          onTab: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ContactUsScreen()),
            // );
          },
        ),
        DrawerItem(
          color: color,
          hoverColor: hoverColor,
          height: height,
          width: width,
          dividerColor: dividerColor,
          itemIcon: Icons.support_agent_outlined,
          title: 'Support',
          onTab: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ProfileScreen()),
            // );
          },
        ),
        DrawerItem(
          color: color,
          hoverColor: hoverColor,
          height: height,
          width: width,
          dividerColor: dividerColor,
          itemIcon: Icons.contact_phone_rounded,
          title: 'Contacts',
          onTab: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ShippingCart()),
            // );
          },
        ),
        DrawerItem(
          color: color,
          hoverColor: hoverColor,
          height: height,
          width: width,
          dividerColor: dividerColor,
          itemIcon: Icons.local_shipping,
          title: 'Shipments',
          onTab: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ContactUsScreen()),
            // );
          },
        ),
        DrawerItem(
          color: color,
          hoverColor: hoverColor,
          height: height,
          width: width,
          dividerColor: dividerColor,
          itemIcon: Icons.update,
          title: 'Update',
          onTab: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => ContactUsScreen()),
            // );
          },
        ),
      ],
    );
  }
}
