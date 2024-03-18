import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../data/entity/constants.dart';
import '../../../data/entity/weather_forecast_model.dart';

class WeatherDetailPage extends StatelessWidget {

  final int index;
  final String arananSehir;
  final WeatherForecastModel currentElement;

  const WeatherDetailPage({super.key,required this.currentElement,required this.arananSehir,required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

 AppBar _buildAppBar() {

    return AppBar(
      title: Text(arananSehir),
      actions: const [
        Icon(Icons.timelapse_outlined),
      ],
    );
 }

 Widget _buildBody() {
    return Center(
      child:Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                  child: Text(
                    arananSehir,
                    style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Hero(
                  tag: "${currentElement.weather.code}_$index",
                  child: CachedNetworkImage(
                    width: 200,
                    imageUrl:
                    "https://cdn.weatherbit.io/static/img/icons/${currentElement.weather.icon}.png",
                    progressIndicatorBuilder: (context, url, progress) => Center(
                      child: CircularProgressIndicator(
                        value: progress.progress,
                      ),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(
                  child: Text(
                    currentElement.weather.description,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w400),
                  ),
                )),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Min: ${currentElement.minTemp}" "°C",
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(
                        "Max: ${currentElement.maxTemp}" "°C",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  )),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "DATE: ",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text(
                    Constants.formatDateTime(currentElement.validDate),
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 18),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
 }



}
