import 'package:evoting_final/core/colour/color.dart';
import 'package:evoting_final/core/services/internet_connection.dart';
import 'package:evoting_final/features/auth/Presentation/screens/login.dart';
import 'package:evoting_final/features/dashboard/Presentation/screens/dashboard_bottombar.dart';
import 'package:evoting_final/features/splash_view/splashview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final internetConnectionProvider =
        Provider.of<InternetConnectionProvider>(context);
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.signal_wifi_off,
                size: 100,
                color: errorcolour,
              ),
              SizedBox(height: 20),
              Text(
                'No Internet Connection',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Please check your internet connection and try again.',
                style: TextStyle(fontSize: 15, color: fontcolour2),
              ),
              SizedBox(height: 66),
              ElevatedButton(
                child: Text('Retry',
                    style: TextStyle(fontSize: 15, color: fontcolour2)),
                onPressed: () {
                  if (internetConnectionProvider.hasInternet) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => BottomMenu()),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
