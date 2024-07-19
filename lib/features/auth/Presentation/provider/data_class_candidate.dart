import 'package:evoting_final/features/auth/Data/model/candidate_Model.dart';
import 'package:evoting_final/features/auth/Domain/controller_data_service_candidate.dart';
import 'package:flutter/material.dart';

class DataClassCandidate extends ChangeNotifier {
  CandidateModel? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    CandidateModel? fetchedPost = await getSinglePostData();
    if (fetchedPost != null) {
      post = fetchedPost;
    }
    loading = false;

    notifyListeners();
  }
}
