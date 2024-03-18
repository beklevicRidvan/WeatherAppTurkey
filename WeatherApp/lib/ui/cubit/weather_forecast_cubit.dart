import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entity/weather_forecast_model.dart';
import '../../data/repo/hava_durumu_repo.dart';

class WeatherForecastCubit extends Cubit<List<WeatherForecastModel>>{
  WeatherForecastCubit():super(<WeatherForecastModel>[]);


  Future<void> getWeatherForecastData(String arananSehir) async{
    var data = await HavaDururumuDaoRepository.getWeatherForeCast(arananSehir);
    emit(data);
  }
}