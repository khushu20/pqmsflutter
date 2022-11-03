import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pqms_flutter/app_constants/shared_preferance.dart';
import 'package:pqms_flutter/app_constants/shared_preferences_const.dart';

class GenerateMpin extends StatefulWidget {
  const GenerateMpin({super.key});

  @override
  State<GenerateMpin> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<GenerateMpin> {
 String username="";
  getLoginStoredValues() async {
    username =
        await SharedPreferencesClass().readTheData(PreferenceConst.username);
    print(username);
  }

  TextEditingController _generatepin = new TextEditingController();
  TextEditingController _mpin = new TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return gernatempin(context);
  }

  gernatempin(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "$username",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PinCodeTextField(
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 60,
                fieldWidth: 50,
                activeFillColor: Colors.white,
              ),
              cursorColor: Colors.black,
              controller: _mpin,
              appContext: context,
              length: 4,
              focusNode: focusNode,
              onChanged: ((value) {})),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: PinCodeTextField(
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 60,
                fieldWidth: 50,
                activeFillColor: Colors.white,
              ),
              cursorColor: Colors.black,
              controller: _mpin,
              appContext: context,
              length: 4,
              onChanged: ((value) {})),
        ),
        TextButton(
            onPressed: (() {
              // Navigator.pushNamed(context, AppRoutes.generateMpin);
            }),
            child: Text("Validate"))
      ]),

      //body: Card(child:PinCodeTextField(appContext: context, length: 4, onChanged: onChanged)),
    );
  }
}
