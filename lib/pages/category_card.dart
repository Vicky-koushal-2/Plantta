
import 'package:flutter/cupertino.dart';

Widget _buildCategorycard(String ccategoryName, IconData icon, Color color){
  return Container(
    margin: EdgeInsets.only(right: 10),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: color.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20)
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon,color: color,size: 30,),
        SizedBox(height: 10,),
        Text(ccategoryName,
        style: TextStyle(color: color,fontWeight: FontWeight.bold),)
      ],
    ),
  );
}