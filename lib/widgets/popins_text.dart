import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InterText extends StatelessWidget {
  final String ? text;
  final double ? fontSize;
  final FontWeight ? fontWeight;
  final Color ? color;
  final TextAlign? textAlign;
  final int ? maxLines;
  final TextOverflow ? overflow;
  const InterText({super.key,this.overflow,this.maxLines,required this.text,required this.fontSize,required this.fontWeight,this.color,this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(text??"",maxLines: maxLines,overflow: overflow,textAlign: textAlign??TextAlign.start,style: GoogleFonts.inter(textStyle:  TextStyle(fontWeight: fontWeight,fontSize: fontSize,color: color??Colors.black))
      ,);
  }
}

class LatoText extends StatelessWidget {
  final String ? text;
  final double ? fontSize;
  final FontWeight ? fontWeight;
  final Color ? color;
  final TextAlign? textAlign;
  const LatoText({super.key,required this.text,required this.fontSize,required this.fontWeight,this.color,this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(text??"",textAlign:textAlign??TextAlign.start,style: GoogleFonts.lato(textStyle:  TextStyle(fontWeight: fontWeight,fontSize: fontSize,color: color??Colors.black))
      ,);
  }
}

class PoppinsText extends StatelessWidget {
  final String ? text;
  final double ? fontSize;
  final FontWeight ? fontWeight;
  final Color ? color;
  final TextAlign? textAlign;
  final double ? lineHeight;
  final int ? maxLines;
  final TextOverflow ? overflow;
  final TextDecoration? decoration;
  const PoppinsText({super.key,this.overflow,this.decoration,this.maxLines,this.lineHeight,required this.text,required this.fontSize,required this.fontWeight,this.color,this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(text??"",overflow: overflow,maxLines:maxLines,textAlign:textAlign??TextAlign.start,style: GoogleFonts.poppins(textStyle:  TextStyle(fontWeight: fontWeight,fontSize: fontSize,color: color??Colors.black,height: lineHeight??0,decoration:decoration), )
      ,);
  }
}