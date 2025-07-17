import 'dart:convert';
import 'package:covid_tracker/Model/world_states_model.dart';
import 'package:covid_tracker/Servicies/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StateService {
  Future<WorldModel> fecthWorldStatesRecords() async {
    final reponse = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (reponse.statusCode == 200) {
      var data = jsonDecode(reponse.body);
      return WorldModel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<List<dynamic>> courientsList() async {
    var data;
    final reponse = await http.get(Uri.parse(AppUrl.countriesList));

    if (reponse.statusCode == 200) {
      var data = jsonDecode(reponse.body);
      return data;
    } else {
      throw Exception("Error");
    }
  }
}
