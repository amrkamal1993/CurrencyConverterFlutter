import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../src/data/repositories/currency_repository.dart';


class DIContainer {
  final GetIt instance;

  DIContainer(this.instance) {
    instance.registerSingletonAsync<SharedPreferences>(
        () async => await SharedPreferences.getInstance());

    instance.registerFactory<CurrencyRepository>(() => CurrencyRepository());


  }

  Future<void> allReadyAsync() => instance.allReady();
}
