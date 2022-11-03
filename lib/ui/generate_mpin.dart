import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class GenerateMpin extends StatefulWidget {
  const GenerateMpin({super.key});

  @override
  State<GenerateMpin> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<GenerateMpin> {
  TextEditingController _generatepin = new TextEditingController();
  TextEditingController _mpin = new TextEditingController();
   FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return gernatempin(context);
  }

  gernatempin(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image:  AssetImage("images/logo.png"),
      fit: BoxFit.cover,)

      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
       
        body: Column(children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: PinCodeTextField(
           pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 60,
                        fieldWidth: 50,
                        activeFillColor:
                             Colors.white,
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
                        activeFillColor:
                             Colors.white,
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
      ),
    );
  }
}
