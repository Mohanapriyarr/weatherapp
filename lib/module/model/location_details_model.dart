// To parse this JSON data, do
//
//     final locationDetailsModel = locationDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LocationDetailsModel locationDetailsModelFromJson(String str) =>
    LocationDetailsModel.fromJson(json.decode(str));

String locationDetailsModelToJson(LocationDetailsModel data) =>
    json.encode(data.toJson());

class LocationDetailsModel {
  // final Coord coord;
  final List<Weather> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  // final Rain rain;
  // final Clouds clouds;
  // final int dt;
  // final Sys sys;
  // final int timezone;
  // final int id;
  final String name;
  final int cod;

  LocationDetailsModel({
    // required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    // required this.rain,
    // required this.clouds,
    // required this.dt,
    // required this.sys,
    // required this.timezone,
    // required this.id,
    required this.name,
    required this.cod,
  });

  LocationDetailsModel copyWith({
    // Coord? coord,
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Rain? rain,
    Clouds? clouds,
    int? dt,
    Sys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) =>
      LocationDetailsModel(
        // coord: coord ?? this.coord,
        weather: weather ?? this.weather,
        base: base ?? this.base,
        main: main ?? this.main,
        visibility: visibility ?? this.visibility,
        wind: wind ?? this.wind,
        // rain: rain ?? this.rain,
        // clouds: clouds ?? this.clouds,
        // dt: dt ?? this.dt,
        // sys: sys ?? this.sys,
        // timezone: timezone ?? this.timezone,
        // id: id ?? this.id,
        name: name ?? this.name,
        cod: cod ?? this.cod,
      );

  factory LocationDetailsModel.fromJson(Map<String, dynamic> json) =>
      LocationDetailsModel(
        // coord: Coord.fromJson(json["coord"]),
        weather:
            List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
        base: json["base"] ?? '',
        main: Main.fromJson(json["main"]),
        visibility: json["visibility"] ?? 0,
        wind: Wind.fromJson(json["wind"]),
        // rain: Rain.fromJson(json["rain"]),
        // clouds: Clouds.fromJson(json["clouds"]),
        // dt: json["dt"] ?? 0,
        // sys: Sys.fromJson(json["sys"]),
        // timezone: json["timezone"] ?? 0,
        // id: json["id"] ?? 0,
        name: json["name"] ?? '',
        cod: json["cod"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        // "coord": coord.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "base": base,
        "main": main.toJson(),
        "visibility": visibility,
        "wind": wind.toJson(),
        // "rain": rain.toJson(),
        // "clouds": clouds.toJson(),
        // "dt": dt,
        // "sys": sys.toJson(),
        // "timezone": timezone,
        // "id": id,
        "name": name,
        "cod": cod,
      };
}

class Clouds {
  final int all;

  Clouds({
    required this.all,
  });

  Clouds copyWith({
    int? all,
  }) =>
      Clouds(
        all: all ?? this.all,
      );

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "all": all,
      };
}

// class Coord {
//   final double lon;
//   final int lat;

//   Coord({
//     required this.lon,
//     required this.lat,
//   });

//   Coord copyWith({
//     double? lon,
//     int? lat,
//   }) =>
//       Coord(
//         lon: lon ?? this.lon,
//         lat: lat ?? this.lat,
//       );

//   factory Coord.fromJson(Map<String, dynamic> json) => Coord(
//         lon: json["lon"]?.toDouble(),
//         lat: json["lat"],
//       );

//   Map<String, dynamic> toJson() => {
//         "lon": lon,
//         "lat": lat,
//       };
// }

class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  Main copyWith({
    double? temp,
    double? feelsLike,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
  }) =>
      Main(
        temp: temp ?? this.temp,
        feelsLike: feelsLike ?? this.feelsLike,
        tempMin: tempMin ?? this.tempMin,
        tempMax: tempMax ?? this.tempMax,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity,
      );

  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: json["temp"]?.toDouble() ?? 0.0,
        feelsLike: json["feels_like"]?.toDouble() ?? 0.0,
        tempMin: json["temp_min"]?.toDouble() ?? 0.0,
        tempMax: json["temp_max"]?.toDouble() ?? 0.0,
        pressure: json["pressure"] ?? 0,
        humidity: json["humidity"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "humidity": humidity,
      };
}

class Rain {
  final double the1H;

  Rain({
    required this.the1H,
  });

  Rain copyWith({
    double? the1H,
  }) =>
      Rain(
        the1H: the1H ?? this.the1H,
      );

  factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the1H: json["1h"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "1h": the1H,
      };
}

class Sys {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  Sys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  Sys copyWith({
    int? type,
    int? id,
    String? country,
    int? sunrise,
    int? sunset,
  }) =>
      Sys(
        type: type ?? this.type,
        id: id ?? this.id,
        country: country ?? this.country,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset,
      );

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        type: json["type"] ?? 0,
        id: json["id"] ?? 0,
        country: json["country"] ?? 'IN',
        sunrise: json["sunrise"] ?? 0,
        sunset: json["sunset"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "id": id,
        "country": country,
        "sunrise": sunrise,
        "sunset": sunset,
      };
}

class Weather {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) =>
      Weather(
        id: id ?? this.id,
        main: main ?? this.main,
        description: description ?? this.description,
        icon: icon ?? this.icon,
      );

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Wind {
  final double speed;
  final int deg;

  Wind({
    required this.speed,
    required this.deg,
  });

  Wind copyWith({
    double? speed,
    int? deg,
  }) =>
      Wind(
        speed: speed ?? this.speed,
        deg: deg ?? this.deg,
      );

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble() ?? 0.0,
        deg: json["deg"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
      };
}
