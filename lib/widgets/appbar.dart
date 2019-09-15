import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../style.dart';

class ReusableWidgets {
    static roomBanner(String title){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 25.0),
      padding: EdgeInsets.symmetric(vertical: 15.0),
      decoration: BoxDecoration(
        color: Color(0xFFF96861),
      ),
      child: Text(title,
        style: AppBarTitle, textAlign: TextAlign.center
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  String pageTitle;

  NavBar(this.pageTitle);

  @override
  Widget build(BuildContext context){
    return Container( 
      padding: EdgeInsets.fromLTRB(0.0,35.0,0.0,15.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width:2.0,color:Color(0xFFBDCC11))
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex:1,
            child: Container(
              padding: EdgeInsets.only(left:20.0),
              constraints: BoxConstraints.expand(height:20.0,width:2.0),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  "assets/images/back.svg",
                  fit:BoxFit.contain,
                  alignment: Alignment.centerLeft,
                )
              )
            )
          ),
          Expanded(
            flex:1,
            child: Container(
              child: Text(pageTitle,
                style: AppBarTitle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex:1,
            child: Container(),
          ),
        ]
      )
    );
  }
}