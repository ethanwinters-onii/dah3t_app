import 'dart:io';

import 'package:discovery_app/engine/image_classification.dart';
import 'package:discovery_app/pages/ai_analysis_page.dart';
import 'package:discovery_app/pages/detail_page.dart';
import 'package:discovery_app/pages/search_return_page.dart';
import 'package:discovery_app/service/api_service.dart';
import 'package:discovery_app/utils/components/custom_camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../misc/constant.dart';
import '../models/natural.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<String> selectImagePath() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        onFileLoading: (_) => const Center(child: CircularProgressIndicator()));
    if (result != null) {
      return result.files.single.path as String;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              CustomSearchField(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 38),
                child: Row(
                  children: const [
                    Expanded(
                        child: Divider(
                      thickness: 1,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'OR',
                        style: TextStyle(color: Colors.black26),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 1,
                    ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 18),
                child: SearchCard(
                  color: Color(0xFF7553F6),
                  title: "Gallery",
                  subtitle: "Pick an image from your collections",
                  icon: const Icon(
                    Icons.collections,
                    color: Colors.greenAccent,
                    size: 30,
                  ),
                  press: () async {
                    String selectedImagePath = await selectImagePath();
                    // print(selectedImagePath);
                    var file = File(selectedImagePath);
                    // print(file.length());
                    final byteData = await file.readAsBytes();
                    final imageData = byteData.buffer.asByteData();
                    final prefs = await SharedPreferences.getInstance();
                    String modelPath = prefs.getString("modelpath")!;
                    final output = await ImageClassification.getOutputDict(
                        modelPath,
                        imageData.buffer.asUint8List(
                            imageData.offsetInBytes, imageData.lengthInBytes),
                        imageData.lengthInBytes);

                    List<Natural> result = await ApiService.getNaturalByKey(
                        name: output.keys.first);
                    if (selectedImagePath != "" && result.isNotEmpty) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => DetailPage(
                                    tag: result[0].species,
                                    e: result[0].entities[0],
                                    acc: output.values.first * 100,
                                  )));
                    }
                  },
                ),
              ),
              SearchCard(
                color: Color(0xFF9CC5FF),
                title: "CameraAI",
                subtitle: "Take a new picture",
                icon: const Icon(
                  Icons.camera,
                  color: Colors.black,
                  size: 30,
                ),
                press: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CameraPage()));
                },
              ),
            ],
          ),
        ));
  }
}

class SearchCard extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final Widget icon;
  final VoidCallback press;

  const SearchCard(
      {super.key,
      required this.color,
      required this.title,
      required this.subtitle,
      required this.icon,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        margin: EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.white60, fontSize: 14),
                )
              ],
            )),
            SizedBox(
              height: 40.h,
              child: VerticalDivider(color: Colors.white70),
            ),
            SizedBox(
              width: 8.w,
            ),
            icon
          ],
        ),
      ),
    );
  }
}

class CustomSearchField extends StatelessWidget {
  CustomSearchField({
    super.key,
  });

  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController speciesController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20.0, right: 20, top: 20, bottom: 8)
                  .r,
          child: Text('Search',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.black)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          child: TextFormField(
            // autofocus: true,
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty) {
                return "";
              }
              return null;
            },
            onSaved: (searchName) {},
            decoration: InputDecoration(
                labelText: "Name *",
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppConstants.backgroundColor2),
                  borderRadius: BorderRadius.circular(25.0),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          child: TextFormField(
            // autofocus: true,
            controller: speciesController,
            validator: (value) {
              if (value!.isEmpty) {
                return "";
              }
              return null;
            },
            onSaved: (searchName) {},
            decoration: InputDecoration(
                labelText: "Species *",
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppConstants.backgroundColor2),
                  borderRadius: BorderRadius.circular(25.0),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          child: ElevatedButton.icon(
              onPressed: () async {
                if (nameController.text == "" && speciesController.text == "") {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      title: "Oops...",
                      text:
                          "Both name and species is empty. Please fill one of them.");
                } else if (speciesController.text == "" ||
                    (speciesController.text != "" &&
                        nameController.text != "")) {
                  List<Natural> result = await ApiService.getNaturalByKey(
                      name: nameController.text);
                  if (result.isNotEmpty) {
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => DetailPage(
                                  tag: result[0].species,
                                  e: result[0].entities[0],
                                )));
                  } else {
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.error,
                        title: "Oops...",
                        text:
                            "Sorry, no result were found for keyword ${nameController.text}");
                  }
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => SearchReturnPage(
                              specie: speciesController.text)));
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppConstants.backgroundColor,
                  minimumSize: const Size(double.infinity, 56),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ))),
              icon: const Icon(
                CupertinoIcons.search,
                color: AppConstants.iconColor,
              ),
              label: const Text(
                'FIND IT',
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
        ),
      ],
    );
  }
}
