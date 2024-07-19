import 'package:evoting_final/core/Appbar.dart';
import 'package:evoting_final/core/colour/color.dart';
import 'package:evoting_final/core/services/internet_connection.dart';
import 'package:evoting_final/features/settings/Presentation/widgets/changepassword.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class changepassword extends StatefulWidget {
  @override
  _changepasswordState createState() => new _changepasswordState();
}

class _changepasswordState extends State<changepassword> {
  bool isLoading = false;
  TextEditingController txtpassword = TextEditingController();
  TextEditingController txtnewpassword = TextEditingController();
  TextEditingController txtconfirmpassword = TextEditingController();

  bool obscureText1 = true;
  bool obscureText2 = true;
  bool obscureText3 = true;

  void toggle1() {
    setState(() {
      obscureText1 = !obscureText1;
    });
  }

  void toggle2() {
    setState(() {
      obscureText2 = !obscureText2;
    });
  }

  void toggle3() {
    setState(() {
      obscureText3 = !obscureText3;
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
      appBar: BaseAppBar(
        title: Text(
          'Change Password',
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
            SizedBox(height: 11.0),
            oldpassword_textfield(context, txtpassword,obscureText1, toggle1),
            SizedBox(height: 11.0),
            newpassword_textfield(context, txtnewpassword,obscureText2, toggle2),
            SizedBox(height: 11.0),
            confirmpassword_textfield(context, txtconfirmpassword,obscureText3, toggle3),
            SizedBox(height: 11.0),
            button(context),
            SizedBox(width: 5.0),
          
          ],
        ),
      ),
    );
  }
}
