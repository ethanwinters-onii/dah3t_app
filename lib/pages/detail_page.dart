import 'package:cached_network_image/cached_network_image.dart';
import 'package:discovery_app/misc/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/world.dart';

class DetailPage extends StatefulWidget {
  final String tag;
  final Entity e;
  double? acc;
  DetailPage({super.key, required this.tag, required this.e, this.acc});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  PageController controller =
      PageController(initialPage: 0, viewportFraction: 1, keepPage: false);

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    print(widget.e.name);
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
                  height: 0.3.sh,
                  color: Colors.black,
                  child: PageView.builder(
                      itemCount: widget.e.images.length,
                      controller: controller,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                            imageUrl: widget.e.images[index],
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            fit: BoxFit.cover);
                      }),
                ),
                Positioned(
                    top: 4,
                    child: BackButton(
                      color: Colors.white,
                    )),
                Positioned(
                    top: 0.27.sh,
                    left: 0,
                    child: Container(
                      width: 1.sw,
                      height: 0.73.sh,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(36),
                              topRight: Radius.circular(36))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Text(
                                      widget.e.name,
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
                                      Text(widget.tag,
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
                                ],
                              ),
                              if (widget.acc != null)
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: Text(
                                      "${widget.acc!.toStringAsFixed(2)} %",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                              fontSize: 26,
                                              color: Colors.black.withOpacity(0.5),
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 24, bottom: 12),
                            child: Text('Images',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 22)),
                          ),
                          Row(
                            children: [
                              ...List.generate(
                                  5,
                                  (index) => InkWell(
                                        onTap: () {
                                          controller.jumpToPage(index);
                                          setState(() {
                                            currentPage = index;
                                          });
                                        },
                                        child: Container(
                                          width: 65.r,
                                          height: 65.r,
                                          margin: EdgeInsets.only(right: 8.r),
                                          decoration: BoxDecoration(
                                            color: index == currentPage
                                                ? Colors.black
                                                : Colors.black12,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${index + 1}',
                                              style: TextStyle(
                                                  color: index == currentPage
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 22),
                                            ),
                                          ),
                                        ),
                                      )),
                            ],
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
                            widget.e.description,
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
                                await launchUrl(Uri.parse(widget.e.linkWiki));
                              },
                              child: Text(widget.e.linkWiki))
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
