import 'package:discovery_app/misc/constant.dart';
import 'package:discovery_app/pages/about_page.dart';
import 'package:discovery_app/route/router_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            width: 1.sw,
            height: 0.3.sh,
            child: Stack(
              children: [
                Image.asset('assets/images/background.webp'),
                Positioned(
                    bottom: 0,
                    left: 0.38.sw,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white,
                      child: Center(
                        child: Text(
                          'IT5005',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AboutPage()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ))),
                icon: const Icon(
                  CupertinoIcons.info,
                  color: AppConstants.backgroundColorDark,
                ),
                label: const Text(
                  'About Us',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.popAndPushNamed(context, RouteName.onBoarding);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ))),
                icon: const Icon(
                  CupertinoIcons.signature,
                  color: AppConstants.backgroundColorDark,
                ),
                label: const Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
          ),
        ],
      ),
    ));
  }
}
