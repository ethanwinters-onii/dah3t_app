import 'dart:convert';
import 'dart:io';

import 'package:discovery_app/openai_models/chat_model.dart';
import 'package:discovery_app/openai_models/openai_model.dart';
import 'package:discovery_app/service/logger_service.dart';
import 'package:discovery_app/utils/commons/modules/restful_module.dart';
import 'package:discovery_app/utils/commons/storage/local_storage_service.dart';
import 'package:discovery_app/utils/constants/endpoints.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/natural.dart';

class ApiService {
  static Future<List<OpenAIModel>> getModels() async {
    try {
      var response = await http.get(Uri.parse(OpenAIEndpoints.getAllModels),
          headers: {'Authorization': "Bearer ${OpenAIEndpoints.API_KEY}"});

      Map jsonResponse = jsonDecode(response.body);
      logger.severe(jsonResponse);

      if (jsonResponse['error'] != null) {
        logger.warning(jsonResponse["error"]["message"]);
        throw HttpException(jsonResponse["error"]["message"]);
      }

      List tmp = [];
      for (var i in jsonResponse['data']) {
        tmp.add(i);
        // logger.warning(i["id"]);
      }

      return OpenAIModel.modelsFromSnapshot(tmp);
    } catch (e) {
      print("error $e");
      rethrow;
    }
  }

  static Future<List<ChatModel>> sendMessage(
      {required String message,
      required String modelId,
      int maxTokens = 100}) async {
    try {
      var response = await http.post(Uri.parse(OpenAIEndpoints.sendMessage),
          headers: {
            "Authorization": 'Bearer ${OpenAIEndpoints.API_KEY}',
            "Content-Type": "application/json"
          },
          body: jsonEncode(
              {"model": modelId, "prompt": message, "max_tokens": maxTokens}));

      Map jsonResponse = jsonDecode(response.body);
      logger.severe(jsonResponse);
      logger.warning(jsonEncode(
          {"model": modelId, "prompt": message, "max_tokens": maxTokens}));

      if (jsonResponse['error'] != null) {
        logger.warning(jsonResponse["error"]["message"]);
        throw HttpException(jsonResponse["error"]["message"]);
      }

      List<ChatModel> chatList = [];

      if (jsonResponse["choices"].length > 0) {
        // logger.warning(jsonResponse["choices"][0]["text"]);
        chatList = List.generate(
            jsonResponse["choices"].length,
            (index) => ChatModel(
                msg: jsonResponse["choices"][index]["text"], chatIndex: 1));
      }
      return chatList;
    } catch (e) {
      logger.shout(e);
      rethrow;
    }
  }

  static Future<bool> login(
      {required String username, required String password}) async {
    try {
      RestfulModule restfulAPI = Get.find();
      var body = {"username": username, "password": password};
      var result = await restfulAPI.post(Endpoints.login, body);
      // logger.shout(result.statusCode);
      if (result.statusCode == 200) {
        if (result.body["code"] == 3) {
          return false;
        } else {
          final info = result.body["data"];
          logger.shout(info);
          LocalStorageService().saveAuthToken(info["accessToken"]);
          LocalStorageService().saveUserName(info["user"]["name"]);
          LocalStorageService().saveJob(info["user"]["occupation"]);
          logger.shout('OK');
          return true;
        }
      }
      return false;
    } catch (e) {
      logger.shout(e);
      return false;
    }
  }

  static Future<bool> register(
      {required String name,
      required String job,
      required String phoneNumber,
      required String email,
      required String username,
      required String password}) async {
    try {
      RestfulModule restfulAPI = Get.find();
      var body = {
        "name": name,
        "phoneNumber": phoneNumber,
        "email": email,
        "gender": "F",
        "dob": "1999-03-03",
        "school": "Ha Noi University of Science and Technology",
        "occupation": job,
        "address": "Ha Noi",
        "createdAt": "2022-11-20",
        "username": username,
        "password": password
      };

      var result = await restfulAPI.post(Endpoints.register, body);
      logger.warning(result);
      if (result.statusCode == 200) {
        if (result.body["code"] == 0) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      logger.shout(e);
      rethrow;
    }
  }

  static Future<List<Natural>> getNaturalData(
      {required List<String> species}) async {
    try {
      RestfulModule restfulAPI = Get.find();
      List<Natural> data = [];
      for (var item in species) {
        print(item);
        var result =
            await restfulAPI.get("${Endpoints.getAllEntityBySpecieName}$item");
        // logger.shout(result.body);
        if (result.statusCode == 200) {
          if (result.body["data"].length > 0) {
            logger.warning(result.body["data"][0]["specie"]["name"]);
            data.add(Natural.fromJson(result.body));
            // logger.warning(result.body["data"].length);
            // for (var json in result.body["data"]) {
            //   logger.warning(json);
            //   Natural a = Natural.fromJson(json);
            //   logger.shout(a.species);
            // }
          }
        }
      }
      logger.warning(data[0].entities[0].images);
      return data;
    } catch (e) {
      logger.shout(e);
      rethrow;
    }
  }

  static Future<List<Natural>> getNaturalByKey({required String name}) async {
    try {
      RestfulModule restfulAPI = Get.find();
      // String nameReplace = name.replaceAll(' ', '+');
      // print("${Endpoints.getAllEntityByKey}$nameReplace");
      var result = await restfulAPI.get("${Endpoints.getAllEntityByKey}$name");
      List<Natural> natural = [];
      if (result.statusCode == 200) {
        if (result.body["data"].length > 0) {
          natural.add(Natural.fromJson(result.body));
        }
      }
      return natural;
    } catch (e) {
      logger.shout(e);
      rethrow;
    }
  }
}
