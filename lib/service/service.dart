import 'package:discovery_app/utils/components/drop_down.dart';
import 'package:flutter/material.dart';

class Services {
  static Future<void> showModalSheet( {required BuildContext context} ) async {
    await showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20)
                      )
                    ),
                    backgroundColor: Color(0xFF343541),
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Flexible(
                                child: Text(
                              "Choose Model:",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                            Flexible(
                              flex: 2,
                              child: ModelsDropDownWidget()
                            )
                          ],
                        ),
                      );
                    });
  }
}