import 'package:evoting_final/features/dashboard/Presentation/widgets/dashboard_bottombar.dart';
import 'package:evoting_final/features/settings/Presentation/screens/settings.dart';
import 'package:evoting_final/features/vote/Presentation/screens/selectresult.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'package:evoting_final/core/colour/color.dart';
import 'package:evoting_final/core/services/internet_connection.dart';
import 'package:evoting_final/features/auth/Presentation/screens/fingerprint.dart';
import 'package:evoting_final/features/dashboard/Presentation/screens/dashboard_home.dart';

class BottomMenu extends StatefulWidget {
  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  int selectedIndex = 0;
  List screens = [
    dashboardScreen(),
    fingerPrint(),
    selectResult(),
    settings(),
    ()
  ];

  void onClicked(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
     final internetConnectionProvider =
        Provider.of<InternetConnectionProvider>(context);

    if (!internetConnectionProvider.hasInternet) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: errorcolour, // Add red background
            content: Text(
              'No Internet Connection Available.....',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
        );
      });
    }
    return Scaffold(
        body: Center(
          child: screens.elementAt(selectedIndex),
        ),
        bottomNavigationBar: BottomMenuWidget(
          selectedIndex: selectedIndex,
          onClicked: onClicked,
        ));
  }
}
