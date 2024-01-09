import 'package:flutter/material.dart';

import '../screens/edit_upload_product_form.dart';
import '../screens/inner_screen/orders/orders_screen.dart';
import '../screens/search_screen.dart';
import '../services/assets_manager.dart';

class DashboardButtonModel {
  final String text, imagePath;
  final Function onPressed;

  DashboardButtonModel({
    required this.text,
    required this.imagePath,
    required this.onPressed,
  });

  static List<DashboardButtonModel> dashboardBtnList(context) => [
    DashboardButtonModel(
      text: "Add a new food",
      imagePath: AssetsManager.cloud,
      onPressed: () {
        Navigator.pushNamed(context, EditOrUploadProductScreen.routeName);
      },
    ),

    DashboardButtonModel(
      text: "inspect all foods",
      imagePath: AssetsManager.shoppingCart,
      onPressed: () {
        Navigator.pushNamed(context, SearchScreen.routeName);
      },
    ),

    // DashboardButtonModel(
    //   text: "View Orders",
    //   imagePath: AssetsManager.order,
    //   onPressed: () {
    //     Navigator.pushNamed(context, OrdersScreenFree.routeName);
    //   },
    // ),
  ];
}
