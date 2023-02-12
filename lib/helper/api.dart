import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/castam.dart';

class API {
  API._();
  static final API api = API._();

  Future<Randomdata?> fetchCurrency() async {
    String api = "https://randomuser.me/api/";

    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map decode = jsonDecode(res.body);

      Randomdata randomdata = Randomdata.fromjson(json: decode);

      return randomdata;
    }
  }
}
