import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../main.dart';
import '../style.dart';

class ImageBanner extends StatelessWidget {
  final String _assetPath;

  ImageBanner(this._assetPath);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   constraints: BoxConstraints.expand(height:250.0,width:250.0),
    //   child: Image.asset(
    //     _assetPath,
    //     fit: BoxFit.contain,
    //   ));
    return Container(
      margin: EdgeInsets.fromLTRB(10.0,50.0,10.0,50.0),
      constraints: BoxConstraints.expand(height:300.0,width:300.0),
      child: SvgPicture.asset(
        _assetPath,
        fit: BoxFit.fill,
      ));
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor, 
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(      
                child: Text('Welcome to Household', style: WelcomeTitle, textAlign: TextAlign.center,),
              ),
              ImageBanner('assets/images/logo.svg'),
              Container(
                margin: EdgeInsets.fromLTRB(70.0,0.0,70.0,30.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context,LoginRoute);
                  },
                  padding: EdgeInsets.all(15.0),
                  child: Text('Login | Sign Up', textAlign: TextAlign.center, style: BtnText),
                ) 
              ),
            ]
          )
        )
      )
    );
  }
}