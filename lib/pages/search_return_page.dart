import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:discovery_app/misc/constant.dart';
import 'package:discovery_app/providers/get_search_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../models/natural.dart';
import '../models/world.dart';
import '../route/router_name.dart';

class SearchReturnPage extends StatefulWidget {
  const SearchReturnPage({super.key, required this.specie});
  final String specie;

  @override
  State<SearchReturnPage> createState() => _SearchReturnPageState();
}

class _SearchReturnPageState extends State<SearchReturnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                      left: 20.0, right: 20, top: 20, bottom: 8)
                  .r,
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.search_off,
                        color: AppConstants.backgroundColor2,
                        size: 36,
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Search Result',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black)),
                ],
              ),
            ),
            ChangeNotifierProvider(
              create: (_) => GetSearchSpecieData(specie: widget.specie),
              child: Builder(builder: (context) {
                final model = Provider.of<GetSearchSpecieData>(context);
                if (model.status == SearchSpecieStatus.loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  print(model.natural.length);
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 20),
                      child: Column(
                        children: [
                          ...model.natural
                              .map((e) => Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 24.0),
                                    child: NaturalListItems(natural: e),
                                  ))
                              .toList(),
                          SizedBox(
                            height: 120.h,
                          )
                        ],
                      ),
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    ));
  }
}

class NaturalListItems extends StatelessWidget {
  const NaturalListItems({super.key, required this.natural});

  final Natural natural;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8).r,
          child: Text(
            natural.species,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600, color: Colors.black, fontSize: 25),
          ),
        ),
        //   SingleChildScrollView(
        //     scrollDirection: Axis.horizontal,
        //     child: Row(
        //       children: [
        //         ...natural.entities
        //             .map((e) => Card(
        //   child: CachedNetworkImage(
        //               imageUrl: e.avatar,
        //               placeholder: (context, url) => Center(child: CircularProgressIndicator()),
        //               errorWidget: (context, url, error) => Icon(Icons.error),
        //               // fit: BoxFit.cover
        //           ),
        // ))
        //             .toList()
        //       ],
        //     ),
        //   ),
        StaggeredGrid.count(
          crossAxisCount: 6,
          mainAxisSpacing: 22,
          crossAxisSpacing: 30,
          children: [
            ...natural.entities
                .map((e) => StaggeredGridTile.count(
                    crossAxisCellCount: 3,
                    mainAxisCellCount: Random().nextInt(4) + 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.detailPage,
                            arguments: [natural.species, e]);
                      },
                      child: Container(
                          width: 0.33.sw,
                          height: 0.33.sw,
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(2, 3),
                                    blurRadius: 3,
                                    spreadRadius: 3)
                              ]),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                child: CachedNetworkImage(
                                    imageUrl: e.avatar,
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                    fit: BoxFit.fitHeight),
                              ),
                              Positioned(
                                  bottom: 8,
                                  left: 8,
                                  child: Container(
                                    width: 50.w,
                                    height: 24.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(CupertinoIcons.star_fill,
                                            color: Colors.orange, size: 16),
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )),
                              Positioned(
                                  bottom: 40,
                                  left: 8,
                                  child: Text(
                                    e.name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )),
                              Positioned(
                                top: 12,
                                right: 8,
                                child: Icon(CupertinoIcons.heart_fill,
                                    color: Random().nextInt(100) % 3 == 0
                                        ? Color(0xffF77777)
                                        : Colors.white,
                                    size: 24),
                              ),
                            ],
                          )),
                    )))
                .toList()
            // ...randomStaggeredGridTile(natural.entities)
          ],
        )
      ],
    );
  }
}

List<Widget> randomStaggeredGridTile(List<Entity> entities) {
  List<Widget> tiles = [];
  int len = entities.length;
  List<int> crACC = List.generate(len, (index) => 0);

  for (var i = 0; i < len; i++) {
    var mACC = Random().nextInt(3) + 1;
    if ((i + 1) % 3 == 0) {
      crACC[i] = crACC[i - 1] + crACC[i - 2];
    } else {
      crACC[i] = Random().nextInt(2) + 1;
    }
    tiles.add(StaggeredGridTile.count(
        crossAxisCellCount: crACC[i],
        mainAxisCellCount: mACC,
        child: Card(
          child: CachedNetworkImage(
              imageUrl: entities[i].avatar,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.cover),
        )));
  }

  return tiles;
}
