import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:discovery_app/models/natural.dart';
import 'package:discovery_app/models/world.dart';
import 'package:discovery_app/providers/get_natural_data.dart';
import 'package:discovery_app/route/router_name.dart';
import 'package:discovery_app/service/logger_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../providers/get_galaxy_data.dart';
import '../providers/get_natural_disaster_data.dart';
import '../providers/get_plant_data.dart';
import '../utils/components/circle_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _controller = TabController(length: 4, vsync: this);
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20, top: 20).r,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Discover',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                    Container(
                      margin: EdgeInsets.only(bottom: 20.h),
                      width: 60.w,
                      height: 60.h,
                      child: Image.asset(
                        "assets/icons/minion50.gif",
                        fit: BoxFit.contain,
                        gaplessPlayback: true,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    labelPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                    controller: _controller,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                    unselectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.w400),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const CircleTabBarDecoration(
                        color: Color(0xFF5d69b3), radius: 3),
                    tabs: [
                      Text('Animals'),
                      Text('Plant'),
                      Text('Natural Disaster'),
                      Text('Galaxy')
                    ],
                  ),
                ),
              ),
              Container(
                  width: double.maxFinite,
                  height: 680.h,
                  padding: const EdgeInsets.only(left: 24, right: 12),
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      ChangeNotifierProvider(
                        create: (_) => GetAnimalData(),
                        child: Builder(builder: (context) {
                          final model = Provider.of<GetAnimalData>(context);
                          if (model.status == AnimalStatus.loading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            print(model.natural.length);
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...model.natural
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 24.0),
                                            child: NaturalListItems(natural: e),
                                          ))
                                      .toList(),
                                  SizedBox(
                                    height: 120.h,
                                  )
                                ],
                              ),
                            );
                          }
                        }),
                      ),
                      // Text('View 1'),
                      ChangeNotifierProvider(
                        create: (_) => GetPlantData(),
                        child: Builder(builder: (context) {
                          final model = Provider.of<GetPlantData>(context);
                          if (model.status == PlantStatus.loading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            print(model.natural.length);
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...model.natural
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 24.0),
                                            child: NaturalListItems(natural: e),
                                          ))
                                      .toList(),
                                  SizedBox(
                                    height: 120.h,
                                  )
                                ],
                              ),
                            );
                          }
                        }),
                      ),
                      ChangeNotifierProvider(
                        create: (_) => GetDisasterData(),
                        child: Builder(builder: (context) {
                          final model = Provider.of<GetDisasterData>(context);
                          if (model.status == DisasterStatus.loading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            print(model.natural.length);
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...model.natural
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 24.0),
                                            child: NaturalListItems(natural: e),
                                          ))
                                      .toList(),
                                  SizedBox(
                                    height: 120.h,
                                  )
                                ],
                              ),
                            );
                          }
                        }),
                      ),
                      ChangeNotifierProvider(
                        create: (_) => GetGalaxyData(),
                        child: Builder(builder: (context) {
                          final model = Provider.of<GetGalaxyData>(context);
                          if (model.status == GalaxyStatus.loading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            print(model.natural.length);
                            return SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...model.natural
                                      .map((e) => Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 24.0),
                                            child: NaturalListItems(natural: e),
                                          ))
                                      .toList(),
                                  SizedBox(
                                    height: 120.h,
                                  )
                                ],
                              ),
                            );
                          }
                        }),
                      ),
                    ],
                  )),
              // Image.network("https://drive.google.com/uc?export=view&id=1DXkZb7mr82YFkBJNT04CFXtDfzp9-GUD")
            ],
          ),
        ),
      ),
    );
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
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
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
