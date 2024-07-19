import 'package:evoting_final/core/colour/color.dart';
import 'package:evoting_final/core/services/internet_connection.dart';
import 'package:evoting_final/features/auth/Presentation/widgets/login_otp.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:evoting_final/features/auth/Domain/controller_login_OTP.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class login_otp extends StatefulWidget {
  @override
  _login_otpState createState() => new _login_otpState();
}

class _login_otpState extends State<login_otp> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
   // final internetConnectionProvider =
    //    Provider.of<InternetConnectionProvider>(context);

   
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
            SizedBox(height: 15.0),
            pincode(context, txtotp_F),
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
            await validateLoginOTPclass.login_otp(context);
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

  Widget pincode(BuildContext context, txtotp_F) {
    return PinCodeTextField(
      length: 5,
      //obscureText: true,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: primaryColor,
          inactiveColor: AppColor,
          inactiveFillColor: primaryColor,
          selectedFillColor: Light_bgColor,
          selectedColor: successcolour,
          activeColor: AppColor),
      cursorColor: fontcolour2,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: txtotp_F,
      keyboardType: TextInputType.number,
      boxShadows: const [
        BoxShadow(
          offset: Offset(0, 1),
          color: fontcolour2,
          blurRadius: 10,
        )
      ],
      onCompleted: (v) {
        debugPrint("Completed");
      },
      onChanged: (value) {
        debugPrint(value);
        setState(() {
          currentText = value;
        });
      },
      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
  }
}
