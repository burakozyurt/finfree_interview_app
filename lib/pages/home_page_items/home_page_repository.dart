import 'dart:convert';

import 'package:finfree_interview_app/models/price_entry_list_of_period.dart';
import 'package:finfree_interview_app/services/http_services.dart';
import 'package:http/http.dart';

class HomePageRepository {

  Future<PriceEntryListOfPeriod> getPriceEntryListOfPeriod() async {
    Response response = await HttpUtils.getRequest('demo');
    if (response.statusCode == 200) {
      PriceEntryListOfPeriod model = new PriceEntryListOfPeriod.fromJson(json.decode(response.body));
      return model;
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }
}
