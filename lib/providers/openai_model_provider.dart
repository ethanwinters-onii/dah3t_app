import 'package:discovery_app/openai_models/openai_model.dart';
import 'package:discovery_app/service/api_service.dart';
import 'package:flutter/foundation.dart';

class OpenAIModelProvider extends ChangeNotifier {
  List<OpenAIModel> models = [];
  String currentModel = "text-davinci-003";
  List<OpenAIModel> get getModelList => models;

  String get getCurrentModel => currentModel;

  void setCurrentModel(String newModel) {
    currentModel = newModel;
    notifyListeners();
  }

  Future<List<OpenAIModel>> getAllModels() async {
    models = await ApiService.getModels();
    return models;
  }
}
