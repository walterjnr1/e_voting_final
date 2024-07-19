import 'package:evoting_final/core/Appbar.dart';
import 'package:evoting_final/core/colour/color.dart';
import 'package:evoting_final/core/services/internet_connection.dart';
import 'package:evoting_final/features/vote/Presentation/widgets/selectresult.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class selectResult extends StatefulWidget {
  @override
  _selectResultState createState() => new _selectResultState();
}

class _selectResultState extends State<selectResult> {
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
      appBar: BaseAppBar(
        title: Text(
          '',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: fontcolour,
          ),
        ),
        appBar: AppBar(),
        //widgets: <Widget>[],
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            header_text(context),
            SizedBox(height: 44.0),
            presidentElection(context),
            SizedBox(height: 20.0),
            governorElection(context),
          ],
        ),
      ),
    );
  }
}
