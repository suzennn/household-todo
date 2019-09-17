import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:io';
import 'dart:convert';

import '../main.dart';
import '../style.dart';
import '../widgets/appbar.dart';
import '../widgets/members.dart';

class ProfilePage extends StatefulWidget {
  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<ProfilePage> {
  String _username ='';
  int _roomId = 0;
  bool _isAdmin = false;
  List _members = [];
  List _memberColors = [];
  List _memberIds = [];

  final storage = FlutterSecureStorage();

  Future<void> getStoredProfileData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String username = prefs.getString("username");
    int roomId = prefs.getInt('room_id');
    bool isAdmin = prefs.getBool('is_admin');
    List members = prefs.getStringList('members');
    List memberColors = prefs.getStringList('member_color');
    List memberIds = prefs.getStringList('member_id');
    setState(() => _username = username);
    setState(() => _roomId = roomId);
    setState(() => _isAdmin = isAdmin);
    setState(() => _members = members);
    setState(() => _memberColors = memberColors);
    setState(() => _memberIds = memberIds);
  }

  @override
  void initState() {
    super.initState();
    getStoredProfileData();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor, 
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            
            NavBar('Profile',0xFFF96861,true),
              
            Container(
              margin: EdgeInsets.symmetric(vertical:70.0,horizontal:40.0),
              // decoration: BoxDecoration(border: Border.all(color:Colors.white)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[

                  Container(
                    margin: EdgeInsets.only(bottom: 40.0),
                    height: 200.0,
                    decoration: BoxDecoration(
                      border: Border.all(color:Color(0xFF61C6C0)),
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Column(      
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical:20.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color:Color(0xFF61C6C0))
                            )
                          ),
                          child: Text('ROOM ID',style: PageTitle, textAlign: TextAlign.center,)
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical:30.0),
                          child: Text('$_roomId',style: RoomIdText, textAlign: TextAlign.center,)
                        )
                      ],
                    )
                  ),

                  Container(
                    height: 300.0,
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.white),
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Column(      
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container( 
                          padding: EdgeInsets.symmetric(vertical:20.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color:Colors.white)
                            )
                          ),
                          child: Text(
                            _isAdmin ? 'ADMIN' : 'MEMBERS',
                            style: TitleText, textAlign: TextAlign.center,
                          )
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 30.0),
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: _members.length,
                              itemBuilder: (context,index){
                                var member = _members[index];
                                var memberid = int.parse(_memberIds[index]);
                                var color = int.parse(_memberColors[index]);
                                return HouseMembersProfile(_isAdmin,member,color,memberid);
                              }
                            )
                          )
                        ) 
                      ],
                    )
                  ),

                ],)
            ),

          ]
        )
      )
    );
  }

}
