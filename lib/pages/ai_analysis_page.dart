import 'dart:io';

import 'package:discovery_app/misc/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class AIAnalysisPage extends StatefulWidget {
  final String imgDir;
  const AIAnalysisPage({super.key, required this.imgDir});

  @override
  State<AIAnalysisPage> createState() => _AIAnalysisPageState();
}

class _AIAnalysisPageState extends State<AIAnalysisPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor2,
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            children: [
              Container(
                width: 1.sw,
                height: 0.27.sh,
                color: Colors.black,
                child: Center(
                  child: Image.file(File(widget.imgDir), fit: BoxFit.contain,),
                ),
              ),
              const Positioned(
                      top: 0,
                      left: 12,
                      child: BackButton(color: Colors.white,)
                    ),
              Positioned(
                top: 0.24.sh,
                left: 0,
                child: Container(
                  width: 1.sw,
                  height: 0.76.sh,
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32)
                  ),
                  child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              "Cat",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      fontSize: 28,
                                      color: Colors.black.withOpacity(0.8),
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                CupertinoIcons.tag_fill,
                                color: AppConstants.textColor,
                                size: 14,
                              ),
                              SizedBox(
                                width: 14,
                              ),
                              Text("Landing Mammal",
                                  style: TextStyle(
                                      color: AppConstants.textColor,
                                      fontSize: 14)),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                ...List.generate(
                                    5,
                                    (index) => const Padding(
                                          padding: EdgeInsets.only(right: 4.0),
                                          child: Icon(
                                            CupertinoIcons.star_fill,
                                            color: Color(0xffFFC107),
                                            size: 17,
                                          ),
                                        )),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Text(
                                  '(5.0)',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black.withOpacity(0.6)),
                                ),
                              ],
                            ),
                          ),
                          
                          Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 12),
                            child: Text('Description',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22)),
                          ),
                          Text(
                            'abc xyz',
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                            maxLines: 8,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Text('Reference',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22)),
                          ),
                          TextButton(
                              onPressed: () async {
                                // await launchUrl(Uri.parse(widget.e.linkWiki));
                              },
                              child: Text('abc'))
                        ],
                      ),
                )
              )
            ],
          )
        ),
      ),
    );
  }
}
