import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/dio_client/dio_client.dart';
import '../data_transfer_object/countries_dto.dart';

class CurrencyRepository {
  final IDioClient dioClient = DioClient();

  Future<Countries?> getCurrencyAsync() async {
    try {
      Response<dynamic> responseResult =
          await dioClient.getClient().get("en/codes.json");
      return Countries.fromJson(responseResult.data);

    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }
}
