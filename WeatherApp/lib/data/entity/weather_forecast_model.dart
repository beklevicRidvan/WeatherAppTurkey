// To parse this JSON data, do
//
//     final weatherForecastModel = weatherForecastModelFromJson(jsonString);

import 'dart:convert';

WeatherForecastModel weatherForecastModelFromJson(String str) => WeatherForecastModel.fromJson(json.decode(str));

String weatherForecastModelToJson(WeatherForecastModel data) => json.encode(data.toJson());

class WeatherForecastModel {
  double appMaxTemp;
  double appMinTemp;
  int clouds;
  int cloudsHi;
  int cloudsLow;
  int cloudsMid;
  DateTime datetime;
  double dewpt;
  double highTemp;
  double lowTemp;
  dynamic maxDhi;
  double maxTemp;
  dynamic minTemp;
  double moonPhase;
  double moonPhaseLunation;
  int moonriseTs;
  int moonsetTs;
  dynamic ozone;
  int pop;
  dynamic precip;
  double pres;
  int rh;
  double slp;
  int snow;
  int snowDepth;
  int sunriseTs;
  int sunsetTs;
  double temp;
  int ts;
  double uv;
  DateTime validDate;
  double vis;
  Weather weather;
  String windCdir;
  String windCdirFull;
  int windDir;
  double windGustSpd;
  double windSpd;

  WeatherForecastModel({
    required this.appMaxTemp,
    required this.appMinTemp,
    required this.clouds,
    required this.cloudsHi,
    required this.cloudsLow,
    required this.cloudsMid,
    required this.datetime,
    required this.dewpt,
    required this.highTemp,
    required this.lowTemp,
    required this.maxDhi,
    required this.maxTemp,
    required this.minTemp,
    required this.moonPhase,
    required this.moonPhaseLunation,
    required this.moonriseTs,
    required this.moonsetTs,
    required this.ozone,
    required this.pop,
    required this.precip,
    required this.pres,
    required this.rh,
    required this.slp,
    required this.snow,
    required this.snowDepth,
    required this.sunriseTs,
    required this.sunsetTs,
    required this.temp,
    required this.ts,
    required this.uv,
    required this.validDate,
    required this.vis,
    required this.weather,
    required this.windCdir,
    required this.windCdirFull,
    required this.windDir,
    required this.windGustSpd,
    required this.windSpd,
  });

  factory WeatherForecastModel.fromJson(Map<String, dynamic> json) => WeatherForecastModel(
    appMaxTemp: json["app_max_temp"]?.toDouble() ?? 0.0,
    appMinTemp: json["app_min_temp"]?.toDouble() ?? 0.0,
    clouds: json["clouds"],
    cloudsHi: json["clouds_hi"],
    cloudsLow: json["clouds_low"],
    cloudsMid: json["clouds_mid"],
    datetime: DateTime.parse(json["datetime"]),
    dewpt: json["dewpt"]?.toDouble(),
    highTemp: json["high_temp"]?.toDouble() ?? 0.0,
    lowTemp: json["low_temp"]?.toDouble() ?? 0.0,
    maxDhi: json["max_dhi"] ?? 0,
    maxTemp: json["max_temp"]?.toDouble() ?? 0.0,
    minTemp: json["min_temp"] ?? 0,
    moonPhase: json["moon_phase"]?.toDouble() ?? 0.0,
    moonPhaseLunation: json["moon_phase_lunation"]?.toDouble() ?? 0.0,
    moonriseTs: json["moonrise_ts"] ?? 0.0,
    moonsetTs: json["moonset_ts"] ?? 0,
    ozone: json["ozone"] ?? 0,
    pop: json["pop"] ?? 0,
    precip: json["precip"] ?? 0,
    pres: json["pres"]?.toDouble() ?? 0.0,
    rh: json["rh"] ?? 0,
    slp: json["slp"]?.toDouble() ?? 0.0,
    snow: json["snow"] ?? 0,
    snowDepth: json["snow_depth"] ?? 0,
    sunriseTs: json["sunrise_ts"] ?? 0,
    sunsetTs: json["sunset_ts"] ?? 0,
    temp: json["temp"]?.toDouble() ?? 0.0,
    ts: json["ts"] ?? 0,
    uv: json["uv"]?.toDouble() ?? 0.0,
    validDate: DateTime.parse(json["valid_date"]),
    vis: json["vis"]?.toDouble() ?? 0.0,
    weather: Weather.fromJson(json["weather"]),
    windCdir: json["wind_cdir"] ?? "null",
    windCdirFull: json["wind_cdir_full"] ?? "null",
    windDir: json["wind_dir"] ?? 0,
    windGustSpd: json["wind_gust_spd"]?.toDouble() ?? 0.0,
    windSpd: json["wind_spd"]?.toDouble() ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    "app_max_temp": appMaxTemp,
    "app_min_temp": appMinTemp,
    "clouds": clouds,
    "clouds_hi": cloudsHi,
    "clouds_low": cloudsLow,
    "clouds_mid": cloudsMid,
    "datetime": "${datetime.year.toString().padLeft(4, '0')}-${datetime.month.toString().padLeft(2, '0')}-${datetime.day.toString().padLeft(2, '0')}",
    "dewpt": dewpt,
    "high_temp": highTemp,
    "low_temp": lowTemp,
    "max_dhi": maxDhi,
    "max_temp": maxTemp,
    "min_temp": minTemp,
    "moon_phase": moonPhase,
    "moon_phase_lunation": moonPhaseLunation,
    "moonrise_ts": moonriseTs,
    "moonset_ts": moonsetTs,
    "ozone": ozone,
    "pop": pop,
    "precip": precip,
    "pres": pres,
    "rh": rh,
    "slp": slp,
    "snow": snow,
    "snow_depth": snowDepth,
    "sunrise_ts": sunriseTs,
    "sunset_ts": sunsetTs,
    "temp": temp,
    "ts": ts,
    "uv": uv,
    "valid_date": "${validDate.year.toString().padLeft(4, '0')}-${validDate.month.toString().padLeft(2, '0')}-${validDate.day.toString().padLeft(2, '0')}",
    "vis": vis,
    "weather": weather.toJson(),
    "wind_cdir": windCdir,
    "wind_cdir_full": windCdirFull,
    "wind_dir": windDir,
    "wind_gust_spd": windGustSpd,
    "wind_spd": windSpd,
  };
}

class Weather {
  String icon;
  String description;
  int code;

  Weather({
    required this.icon,
    required this.description,
    required this.code,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    icon: json["icon"] ?? "c01d",
    description: json["description"] ?? "Clear sky",
    code: json["code"] ?? 800,
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
    "description": description,
    "code": code,
  };
}
