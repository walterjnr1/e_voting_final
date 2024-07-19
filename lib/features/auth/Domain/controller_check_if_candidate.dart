import 'dart:async';
import 'dart:convert';
import 'package:evoting_final/core/App_constant/constant.dart';
import 'package:evoting_final/features/settings/Presentation/screens/candidate_profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class validateVoterclass {
  static Future<void> check_if_candidate(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? voterid_session = prefs.getString('voterid_session');

    var url = "${URL_PREFIX}/validateCandidate";
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'voterID': voterid_session}),
    );

    var data = jsonDecode(response.body);
    var message = data["message"];
    print(message);
    if (response.statusCode == 201) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => candidateProfile()));
    } else {
      print(response.body);

      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );
    }
  }

  static Future<void> resendotp(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? voterid_session = prefs.getString('voterid_session');

    var url = "${URL_PREFIX}/resendOtp";
    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'voterID': voterid_session}),
    );
    var data = jsonDecode(response.body);
    var message = data["message"];
    print(message);
    if (response.statusCode == 201) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message:
              'OTP Has been resent to Your registered Email and Phone Number',
        ),
      );
    } else {
      print(response.body);

      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: message,
        ),
      );
    }
  }
}
