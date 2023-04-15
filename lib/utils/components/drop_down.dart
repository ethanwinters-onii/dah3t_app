import 'package:discovery_app/misc/constant.dart';
import 'package:discovery_app/openai_models/openai_model.dart';
import 'package:discovery_app/providers/openai_model_provider.dart';
import 'package:discovery_app/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModelsDropDownWidget extends StatefulWidget {
  const ModelsDropDownWidget({super.key});

  @override
  State<ModelsDropDownWidget> createState() => _ModelsDropDownWidgetState();
}

class _ModelsDropDownWidgetState extends State<ModelsDropDownWidget> {
  String? currentModels;

  @override
  Widget build(BuildContext context) {
    final modelsProvider = Provider.of<OpenAIModelProvider>(context);
    currentModels = modelsProvider.getCurrentModel;
    return FutureBuilder<List<OpenAIModel>>(
      future: modelsProvider.getAllModels(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        return snapshot.data == null || snapshot.data!.isEmpty
            ? const SizedBox.shrink()
            : FittedBox(
                child: DropdownButton(
                    dropdownColor: Color(0xFF343541),
                    iconEnabledColor: Colors.white,
                    items: snapshot.data!
                        .map<DropdownMenuItem<String>>(
                            (e) => DropdownMenuItem<String>(
                                value: e.id,
                                child: Text(
                                  e.id,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )))
                        .toList(),
                    value: currentModels,
                    onChanged: (value) {
                      // setState(() {
                      //   currentModels = value.toString();
                      // });
                      modelsProvider.setCurrentModel(value.toString());
                    }),
              );
      },
    );
  }
}
