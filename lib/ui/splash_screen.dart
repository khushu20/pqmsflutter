import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pqms_flutter/models/splash_model.dart';
import 'package:pqms_flutter/ui/login_screen.dart';
import 'package:pqms_flutter/ui/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return intScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    /*
Base Url:https://uat3.cgg.gov.in/cmnwebservicesmobile/attwsapi/
endpoint : versionCheck
type: POST
headders: {'Content-Type': 'application/json; charset=UTF-8'}
parameters:null
body:  {
    "appName": "MJPHRMS",
    "mobileType": "Android"
   
}
autherization: null
 */

    //
    /* Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen())); */
    fetchSplashDetailsFromApi();
  }

  intScreen(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: SizedBox(child: Image.asset("images/logo.png")),
            ),
          ],
        ),
      ),
    );
  }
    fetchSplashDetailsFromApi() async {
    //step1: create request url with base url and endpoint
    final requestUrl = "https://uat3.cgg.gov.in/cmnwebservicesmobile/attwsapi/" + "versionCheck";
//step 2: create payload if request post ,put,option
    final requestPayload = {
      "appName": "MJPHRMS",
    "mobileType": "Android"
    };

// step 3: create headders and autherazation
    Map<String, String> requestHeaders = {'Content-Type': 'application/json; charset=UTF-8', 'Access-Control-Allow-Origin': '*'};
// step 4: dio or http use this package connect to server
    final _dioObject = Dio();

    try {
      final _response = await _dioObject.post(requestUrl,
          data: requestPayload, options: Options(headers: requestHeaders));
      //convet this response from json to modelclass

      print(_response.data);
      final splashResopnse = SplashModel.fromJson(_response.data);
      if(splashResopnse.statusCode==200){
 Fluttertoast.showToast(
        msg: splashResopnse.data?.appName.toString() ?? "" ,  // message
        toastLength: Toast.LENGTH_SHORT, // length
        gravity: ToastGravity.CENTER,    // location
        timeInSecForIosWeb: 1               // duration
    );
    Navigator.pushNamed(context, AppRoutes.login);

      }else if(splashResopnse.statusCode==204){
         Fluttertoast.showToast(
        msg: splashResopnse.statusMessage ?? "" ,  // message
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
