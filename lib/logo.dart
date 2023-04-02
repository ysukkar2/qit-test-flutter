import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
      children: [
        Text('الجودة لتكنولوجيا المعلومات'),
        Container(
          height: 500,
          
          child: SvgPicture.asset('assets/logo.svg'
          
          ),
          
          
          
        
        ),
      ],
    ),
 
    );   
  }
}