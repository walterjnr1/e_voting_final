import 'package:evoting_final/core/colour/color.dart';
import 'package:evoting_final/core/services/internet_connection.dart';
import 'package:evoting_final/features/auth/Presentation/widgets/register_otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evoting_final/features/auth/Domain/controller_register_OTP.dart';
import 'package:provider/provider.dart';

class register_otp extends StatefulWidget {
  @override
  _register_otpState createState() => new _register_otpState();
}

class _register_otpState extends State<register_otp> {
    bool isLoading = false;

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
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            header_text(context),
            SizedBox(height: 11.0),
            msg_text(context),
            SizedBox(height: 20.0),
            register_otpWidget(),
            //otp_textfield(context,txtcode_F),
            SizedBox(height: 15.0),
            footer_text(context),
            SizedBox(height: 10.0),
            resend(context),
            SizedBox(height: 5.0),
            continuebtn(context),
            SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }

  Widget continuebtn(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor, shape: const StadiumBorder()),
        onPressed: () async {
          setState(() {
            isLoading = true;
          });

          try {
            await validateRegistrationOTPclass.otp(context);
          } finally {
            setState(() {
              isLoading = false;
            });
          }
        },
        child: isLoading
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Loading...',
                    style: GoogleFonts.lato(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(width: 10),
                  CircularProgressIndicator(
                    color: primaryColor,
                  ),
                ],
              )
            : Text('Continue',
                style: GoogleFonts.lato(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                )),
      ));
  }
}

