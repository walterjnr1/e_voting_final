import 'package:evoting_final/core/Appbar.dart';
import 'package:evoting_final/core/colour/color.dart';
import 'package:evoting_final/core/services/internet_connection.dart';
import 'package:evoting_final/features/auth/Domain/controllerLogin.dart';
import 'package:evoting_final/features/auth/Presentation/widgets/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class voterlogin extends StatefulWidget {
  @override
  _voterloginState createState() => new _voterloginState();
}

class _voterloginState extends State<voterlogin> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
//  final internetConnectionProvider =
       // Provider.of<InternetConnectionProvider>(context);

   
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
            SizedBox(height: 11.0),
            header_img(context),
            voterid_textfield(context, txtvoterid_F),
            SizedBox(height: 20.0),
            voterloginWidget(),
            SizedBox(height: 2.0),
            RegisterLabel(context),
            SizedBox(width: 5.0),
            Row(
              children: <Widget>[
                voter_signup_button(context),
                SizedBox(width: 5.0),
              ],
            )
          ],
        ),
        
      ),
    );
  }
}
