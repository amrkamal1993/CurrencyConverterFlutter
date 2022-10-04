import 'package:currency_converter/core/router/route_names.dart';
import 'package:flutter/material.dart';

import '../../src/view/currency_converter_screen.dart';


class RouteGenerator {
  static Alignment pageAlignment = Alignment.bottomCenter;
  static Duration pushDuration = const Duration(milliseconds: 300);
  static Duration popDuration = const Duration(milliseconds: 300);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.index:
        return   MaterialPageRoute(builder: (context)=> const Scaffold());
      case RouteNames.currencyConverter:
        return   MaterialPageRoute(builder: (context)=>  const CurrencyConverterScreen());
      default:
        return   MaterialPageRoute(builder: (context)=> const Scaffold());
    }
  }

}
