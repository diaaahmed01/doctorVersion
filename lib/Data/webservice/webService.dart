import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../common/constants/api_constants.dart';

class WebService {
  String endpoint = ApiConstants.baseUrl;
  String DoctorApi = ApiConstants.Doctorapi;
  String ArticlesApi = ApiConstants.ArticleApi;
  String doctorHomePageApi = ApiConstants.DoctorHomePageApi;
  String articleCommunication = ApiConstants.ArticleCommunication;
  String articleComments = ApiConstants.ArticleCommentsApi;
  String articleLikes = ApiConstants.ArticleLikesApi;
  String patientApi = ApiConstants.PatientApi;
  String articleApi = ApiConstants.ArticleApi;

  Map<String, String> get headers {
    return {
      'Content-type': 'application/json',
    };
  }

  Future getDoctorHomePageInfo(String Id) async {
    Uri url1 = Uri.https(endpoint, doctorHomePageApi);
    Uri url = Uri.parse("$url1/$Id");
    print(url);
    Response response = await get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(result);
      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future getArticleCommunication(String? Id) async {
    Uri url1 = Uri.https(endpoint, articleCommunication);
    Uri url = Uri.parse("$url1/$Id");
    print(url);
    Response response = await get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future getDoctorById(String Id) async {
    Uri url1 = Uri.https(endpoint, DoctorApi);
    Uri url = Uri.parse("$url1/$Id");
    Response response = await get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(result);
      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future getPatientById(String Id) async {
    Uri url1 = Uri.https(endpoint, patientApi);
    Uri url = Uri.parse("$url1/$Id");
    Response response = await get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(result);
      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List> getArticles() async {
    var url = Uri.https(endpoint, ArticlesApi);
    print(url);
    Response response = await get(url);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      print(result);
      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List> getDoctorArtclies(String Id) async {
    Uri url1 = Uri.https(endpoint, ArticlesApi);
    Uri url = Uri.parse("$url1/$Id");
    Response response = await get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(result);
      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List> getAppointmentsByDoctorId(String Id) async {
    Uri url1 = Uri.https(endpoint, DoctorApi);
    Uri url = Uri.parse("$url1/$Id");
    Response response = await get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(result);
      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<bool> updateDoctorById(Map data, String Id) async {
    bool status = false;
    Uri url1 = Uri.https(endpoint, DoctorApi);
    Uri url = Uri.parse("$url1/$Id");

    http.Response response = await http.patch(url,
        body: jsonEncode(data), headers: {'Content-type': 'application/json'});

    if (response.statusCode == 200) {
      status = response.body.isNotEmpty;
    }

    return status;
  }

  Future<bool> postComment(String? Id, Map<String, dynamic>? body) async {
    Uri url1 = Uri.https(endpoint, articleComments);
    Uri url = Uri.parse("$url1/$Id");
    print(url);
    print(jsonEncode(body));
    Response response =
        await patch(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<bool> postArticle(Map<String, dynamic>? body) async {
    Uri url1 = Uri.https(endpoint, articleApi);
    Uri url = Uri.parse("$url1");
    print(url);
    print("...from post article api" + jsonEncode(body));
    Response response =
        await post(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future getArticleById(String Id) async {
    Uri url1 = Uri.https(endpoint, ArticlesApi);
    Uri url = Uri.parse("$url1/$Id");
    Response response = await get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(result);
      return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future likeArticle(String Id, Map<String, dynamic>? body) async {
    Uri url1 = Uri.https(endpoint, articleLikes);
    Uri url = Uri.parse("$url1/$Id");
    Response response =
        await patch(url, headers: headers, body: jsonEncode(body));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    }
    return false;
  }
}
