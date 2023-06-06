import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var userName = "";
  var userUid = "";
  var userEmail = "";
  var userPhoto = "";

  Future<void> bringData() async {
    var snapshot = FirebaseFirestore.instance
        .collection("users")
        .doc("${FirebaseAuth.instance.currentUser?.uid}")
        .get();

    var data = await snapshot;

    var name = (data.data()?["name"].toString() ?? "");
    var uid = (data.data()?["uid"].toString() ?? "");
    var email = (data.data()?["userEmail"].toString() ?? "");
    var photo = (data.data()?["imageUrl"].toString() ?? "");

    setState(() {
      userName = name;
      userUid = uid;
      userEmail = email;
      userPhoto = photo;
    });
  }

  @override
  void initState() {
    super.initState();
    bringData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          '내 정보',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Stack(children: [
            CupertinoNavigationBarBackButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Color(0xff252532),
            ),
          ]),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 200,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "사용자 이메일 : ${userEmail}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "사용자 이름: ${userName}",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ]),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      height: 250,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('계정',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              TextButton(
                                  child: Text('비밀번호 변경',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.0)),
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero)),
                              TextButton(
                                  child: Text('이메일 변경',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.0)),
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero)),
                            ]),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      height: 330,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('커뮤니티',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                  child: Text('닉네임 설정',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.0)),
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero)),
                              TextButton(
                                  child: Text('프로필 이미지 변경',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.0)),
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero)),
                              TextButton(
                                  child: Text('이용 제한 내역',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.0)),
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero)),
                              TextButton(
                                  child: Text('쪽지 설정  ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.0)),
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero)),
                              TextButton(
                                  child: Text('커뮤니티 이용규칙',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.0)),
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero)),
                            ]),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                      height: 300,
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey.shade300, width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('앱 설정',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      child: Text('다크모드  ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15.0)),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero)),
                                  TextButton(
                                      child: Text('시스템 기본값',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13.0)),
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero)),
                                ],
                              ),
                              TextButton(
                                  child: Text('알림 설정 ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.0)),
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero)),
                              TextButton(
                                  child: Text('암호 잠금 ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.0)),
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero)),
                              TextButton(
                                  child: Text('캐시 삭제 ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15.0)),
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero)),
                            ]),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 230,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('기타',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                              child: Text('정보 동의 설정',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0)),
                              onPressed: () {},
                              style:
                                  TextButton.styleFrom(padding: EdgeInsets.zero)),
                          TextButton(
                              child: Text('회원 탈퇴  ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0)),
                              onPressed: () {},
                              style:
                                  TextButton.styleFrom(padding: EdgeInsets.zero)),
                          TextButton(
                              child: Text('로그아웃  ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15.0)),
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                              style:
                                  TextButton.styleFrom(padding: EdgeInsets.zero)),
                        ]),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
