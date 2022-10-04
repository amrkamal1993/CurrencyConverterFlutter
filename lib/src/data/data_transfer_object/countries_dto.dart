
import 'dart:convert';

Countries countriesFromJson(String str) => Countries.fromJson(json.decode(str));

class Countries {
  Map<String, String> countries;

  Countries({
    required this.countries,
  });

  factory Countries.fromJson(Map<String, dynamic> json) {
    return Countries(
      countries: Map.from(json)
          .map((k, v) => MapEntry<String, String>(k, v)),
    );
  }

  Map<String, dynamic> toJson() => {
    "": Map.from(countries).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
