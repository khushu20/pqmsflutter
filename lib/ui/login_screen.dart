import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pqms_flutter/app_constants/shared_preferance.dart';
import 'package:pqms_flutter/app_constants/shared_preferences_const.dart';
import 'package:pqms_flutter/models/login_model.dart';
import 'package:pqms_flutter/ui/custom_widgets/custom_button.dart';
import 'package:pqms_flutter/ui/custom_widgets/custom_textfield.dart';
import 'package:pqms_flutter/ui/routes/app_routes.dart';

/*
Base Url:https://pqms-uat.cgg.gov.in/pqms/
endpoint : mobileLogin
type: POST
headders: clientId:Client123Cgg
parameters:null
body:  {
     "IMEI":"9664f87bc73233ea",
      "deviceId":"9664f87bc73233ea",
      "password":"PQMS@2022",
      "username":"Rekha_Mobile"
}
autherization: null
 */

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginScreen> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool _isPasswordvisible = true;
  @override
  Widget build(BuildContext context) {
    return login(context);
  }

  login(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(controller: _name, hintText: "please enter name"),
            CustomTextField(
                controller: _password, hintText: "please enter password"),
            TextButton(
                onPressed: (() {
                  if (loginValidated()) {
                    fetchLoginDetailsFromApi();
                    //
                  }
                }),
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
  /*  CustomButton(
                backgroundcolor: Colors.blueGrey,
                text: "Login",
                onPressed: () {
                  print("clicked");
                  Future.delayed(Duration.zero, () {
 Navigator.pushNamed(context, AppRoutes.generateMpin);
});
                  
                }) */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchLoginDetailsFromApi();
  }

  bool loginValidated() {
    if (_name.text.isEmpty) {
      showAlert("please enter name");
      return false;
    } else if (_password.text.isEmpty) {
      showAlert("please enter password");
      return false;
    }

    return true;
  }

  showAlert(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  // print("button Action");
                  Navigator.pop(context);
                },
                child: Text("ok"),
                //style: ButtonStyle(backgroundColor:),
              )
            ],
          );
        });
  }

  fetchLoginDetailsFromApi() async {
    //step1: create request url with base url and endpoint
    final requestUrl = "https://pqms-uat.cgg.gov.in/pqms/" + "mobileLogin";
//step 2: create payload if request post ,put,option
    final requestPayload = {
      "IMEI": "9664f87bc73233ea",
      "deviceId": "9664f87bc73233ea",
      "password": _password.text.toString(),
      "username": _name.text.toString()
    };

// step 3: create headders and autherazation
    Map<String, String> requestHeaders = {'clientId': 'Client123Cgg', 'Content-Type': 'application/json; charset=UTF-8', 'Access-Control-Allow-Origin': '*'};

// step 4: dio or http use this package connect to server
    final _dioObject = Dio();

    try {
      final _response = await _dioObject.post(requestUrl,
          data: requestPayload, options: Options(headers: requestHeaders));
      //convet this response from json to modelclass

      print(_response.data);
      final loginResponse = LoginModel.fromJson(_response.data);
      if(loginResponse.statusCode==200){
         SharedPreferencesClass().writeTheData(PreferenceConst.username, loginResponse.data?.userName);
          SharedPreferencesClass().writeTheData(PreferenceConst.token, loginResponse.data?.token);
       
 Fluttertoast.showToast(
        msg: loginResponse.data?.rolename.toString() ?? "" ,  // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER,    // location
        timeInSecForIosWeb: 1               // duration
    );
    Navigator.pushNamed(context, AppRoutes.generateMpin);

      }else if(loginResponse.statusCode==204){
         Fluttertoast.showToast(
        msg: loginResponse.statusMessage ?? "" ,  // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER,    // location
        timeInSecForIosWeb: 1               // duration
    );
      }
     
    } on DioError catch (e) {
      if (e.response?.statusCode == 400 || e.response?.statusCode == 500) {
       final errorMessage = e.response?.statusMessage;
       Fluttertoast.showToast(
        msg: errorMessage ??"",  // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER,    // location
        timeInSecForIosWeb: 1               // duration
    );
    
      }
      print("error is $e");

      print("status code is ${e.response?.statusCode}");
    }
// step 5: print the response
  }
}
