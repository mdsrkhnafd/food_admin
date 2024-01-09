import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/dashboard_btn_model.dart';
import '../providers/theme_provider.dart';
import '../services/assets_manager.dart';
import '../widgets/dashboard_btns.dart';
import '../widgets/title_text.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/DashboardScreen';

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const TitlesTextWidget(label: "Dashboard Screen"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsManager.shoppingCart),
          ),
          actions: [
            IconButton(
              onPressed: () {
                themeProvider.setDarkTheme(
                    themeValue: !themeProvider.getIsDarkTheme);
              },
              icon: Icon(themeProvider.getIsDarkTheme
                  ? Icons.light_mode
                  : Icons.dark_mode),
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            DashboardButtonModel.dashboardBtnList(context).length,
            (index) => DashboardButtonsWidget(
              text: DashboardButtonModel.dashboardBtnList(context)[index].text,
              imagePath: DashboardButtonModel.dashboardBtnList(context)[index].imagePath,
              onPressed: DashboardButtonModel.dashboardBtnList(context)[index].onPressed,
            ),
          ),
        ));
  }
}
