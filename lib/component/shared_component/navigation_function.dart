import 'package:flutter/material.dart';

void pushReplacement(BuildContext context , screen){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>screen)) ;
}

void push(BuildContext context , screen){
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>screen)) ;
}