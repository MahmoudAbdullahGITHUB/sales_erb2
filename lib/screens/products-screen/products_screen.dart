import 'package:flutter/material.dart';
import 'package:sales_erb/shared/constants/images-providers.dart';

class ProductsScreen extends StatelessWidget {
  static const routName = '/product-screen';

  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;
  final bool hideStatus;

  // var scaffoldKey = GlobalKey<ScaffoldState>();
  var titleController = TextEditingController();

  ProductsScreen(
      {Key? key,
      required this.menuScreenContext,
      required this.onScreenHideButtonPressed,
      this.hideStatus = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                          labelText: "Search",
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0)))),
                      onChanged: (text) {},
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                const Flexible(
                  flex: 1,
                  child: CustomButton(
                    buttonIcon: Icons.menu_open_outlined,
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: CustomButton(
                    buttonIcon: Icons.filter_list,
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: CustomButton(
                    buttonIcon: Icons.apps_rounded,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: const [
                CircleAvatar(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      image: AssetImage(ImageProviders.LOGO),
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData buttonIcon;

  const CustomButton({
    required this.buttonIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 47,
        width: 50,
        child: InkWell(
          onTap: () {},
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            child: Icon(
              buttonIcon,
              size: 23,
              color: Colors.blue[700],
            ),
          ),
        ));
  }
}
