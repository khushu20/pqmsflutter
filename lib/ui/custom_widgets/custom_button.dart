import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key ,required this.text,this.backgroundcolor,required this.onPressed});
   final String text;
  final Color? backgroundcolor;
   final Function onPressed; 


  @override
  Widget build(BuildContext context) {
    
    return Container(
        
          height: 50,
          width: 326,
          color: backgroundcolor,
          
          child: TextButton(onPressed: onPressed(), child: Text(text)),
       padding: EdgeInsets.symmetric(horizontal: 10.0),
       margin: EdgeInsets.symmetric(vertical: 10.0
       ));
      
  }
}