import 'package:discovery_app/utils/constants/network_constant.dart';

class Endpoints {
  static String baseUrl = NetworkConstant.localhost;
  static String register = '$baseUrl/auth/register';
  static String login = '$baseUrl/auth/login';
  static String getAllEntityBySpecieName =
      "$baseUrl/get/entity-by?specie_name=";
  static String getAllEntityByKey = "$baseUrl/search/all?key=";
}

class OpenAIEndpoints {
  static String API_KEY = "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";
  static String baseUrl = NetworkConstant.openai;
  static String getAllModels = "$baseUrl/v1/models";
  static String sendMessage = "$baseUrl/v1/completions";
}
