import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:evoting_final/core/App_constant/constant.dart';
import 'package:evoting_final/features/auth/Data/model/voter_Model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

  Future<VoterModel?> getSinglePostData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    String? voterid_session = prefs.getString('voterid_session');
   
  VoterModel? result;
  try {
        var url = "${URL_PREFIX}/getVoterDetails?voterID=$voterid_session";
      final response = await http.get(
      Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },);
    if (response.statusCode == 201) {
      final item = json.decode(response.body);
      result = VoterModel.fromJson(item);
    } else {
      print("error");
    }
  } catch (e) {
    log(e.toString());
  }
  return result;
}