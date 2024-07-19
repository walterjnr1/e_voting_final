import 'package:evoting_final/core/App_constant/constant.dart';
import 'package:evoting_final/core/colour/color.dart';
import 'package:evoting_final/features/auth/Domain/controller_candidate_Register.dart';
import 'package:evoting_final/features/auth/Presentation/provider/data_class_voter.dart';
import 'package:flutter/material.dart';

class candidateregisterWidget extends StatefulWidget {
  @override
  _candidateregisterWidgetState createState() =>
      new _candidateregisterWidgetState();
}

class _candidateregisterWidgetState extends State<candidateregisterWidget> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Add your refresh logic here
      },
      child: Scaffold(
          // Add your other widgets here
          ),
    );
  }
}

Widget img_path(BuildContext context, DataClassVoter postUserModel) {
  txtimg_F.text = '${postUserModel.post?.image?? ""}';
  return Visibility(
    visible: false,
    child: TextFormField(
      enabled: false,
      style: TextStyle(
        color: Colors.black, // Add this line to set the font color
      ),
      controller: txtimg_F,
      decoration: InputDecoration(
        labelText: 'image',
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: black, width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: black, width: 2.0),
        ),
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your Voter ID';
        }
        return null;
      },
    ),
  );
}
Widget header_img(BuildContext context, DataClassVoter postUserModel) {
  return Center(
    child: CircleAvatar(
      backgroundImage:
          NetworkImage('${img_url}/${postUserModel.post?.image ?? ""}'),
      //NetworkImage(
      //'https://media.istockphoto.com/id/1460124878/photo/social-media-connection-and-woman-typing-on-a-phone-for-communication-app-and-chat-web-search.webp?b=1&s=170667a&w=0&k=20&c=2jxUr_WTdJyMUD0OcnXD1Fdbb63f8TDkTvpcPsA7aHI='),
      minRadius: 66,
      maxRadius: 66,
    ),
  );
}

Widget fullname(BuildContext context, DataClassVoter postUserModel) {
  txtfullname_F.text = '${postUserModel.post?.fullname ?? ""}';
  return TextFormField(
    enabled: false,
    style: TextStyle(
      color: Colors.black, // Add this line to set the font color
    ),
    controller: txtfullname_F,
    decoration: InputDecoration(
      labelText: 'Fullname',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your Voter ID';
      }
      return null;
    },
  );
}

Widget state(BuildContext context, DataClassVoter postUserModel) {
  txtstate_F.text = '${postUserModel.post?.state ?? ""}';
  return TextFormField(
    enabled: false,
    style: TextStyle(
      color: Colors.black, // Add this line to set the font color
    ),
    controller: txtstate_F,
    decoration: InputDecoration(
      labelText: 'State',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your Voter ID';
      }
      return null;
    },
  );
}

Widget email(BuildContext context, DataClassVoter postUserModel) {
  txtemail_F.text = '${postUserModel.post?.email ?? ""}';
  return TextFormField(
    enabled: false,
    style: TextStyle(
      color: Colors.black, // Add this line to set the font color
    ),
    controller: txtemail_F,
    decoration: InputDecoration(
      labelText: 'Email',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your Voter ID';
      }
      return null;
    },
  );
}

Widget phone(BuildContext context, DataClassVoter postUserModel) {
  txtphone_F.text = '${postUserModel.post?.phone ?? ""}';
  return TextFormField(
    enabled: false,
    style: TextStyle(
      color: Colors.black, // Add this line to set the font color
    ),
    controller: txtphone_F,
    decoration: InputDecoration(
      labelText: 'Phone',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your Voter ID';
      }
      return null;
    },
  );
}

Widget voterID(BuildContext context, DataClassVoter postUserModel) {
  txtvoterID_F.text = '${postUserModel.post?.voterID ?? ""}';
  return TextFormField(
    enabled: false,
    style: TextStyle(
      color: Colors.black, // Add this line to set the font color
    ),
    controller: txtvoterID_F,
    decoration: InputDecoration(
      labelText: 'Voter ID',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your Voter ID';
      }
      return null;
    },
  );
}

Widget occupation(BuildContext context, DataClassVoter postUserModel) {
  txtoccupation_F.text = '${postUserModel.post?.occupation ?? ""}';
  return TextFormField(
    enabled: false,
    style: TextStyle(
      color: Colors.black, // Add this line to set the font color
    ),
    controller: txtoccupation_F,
    decoration: InputDecoration(
      labelText: 'Occupation',
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: black, width: 2.0),
      ),
      labelStyle: TextStyle(fontWeight: FontWeight.bold),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your Voter ID';
      }
      return null;
    },
  );
}
