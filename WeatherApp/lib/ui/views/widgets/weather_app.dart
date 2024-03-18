import 'package:bloc_pattern_providerpackage_katmanlimimari_uygulamasi/data/entity/hava_durumu_model.dart';
import 'package:bloc_pattern_providerpackage_katmanlimimari_uygulamasi/ui/views/widgets/weather_detail_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/entity/constants.dart';
import '../../../data/entity/weather_forecast_model.dart';
import '../../cubit/weather_app_cubit.dart';

import 'package:flutter/material.dart';

import '../../cubit/weather_forecast_cubit.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String kullanicininGirdigiSehir = "İstanbul";
  bool visibilty = false;
  final _textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherAppCubit>().listeyiYukle(kullanicininGirdigiSehir);
      context
          .read<WeatherForecastCubit>()
          .getWeatherForecastData(kullanicininGirdigiSehir);
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: _buildBody(deviceHeight),
    );
  }


  PreferredSizeWidget _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 90),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/cloud.png"), fit: BoxFit.cover)),
          ),
          AppBar(
            backgroundColor: Colors.transparent,
            title: visibilty
                ? _buildAppBarTextFormField()
                : const Text(
              "Weather App",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      visibilty = !visibilty;
                    });
                  },
                  icon: visibilty
                      ? const Icon(
                    CupertinoIcons.clear,
                    size: 30,
                  )
                      : const Icon(
                    Icons.search,
                    size: 40,
                  ))
            ],
          ),
        ],
      ),
    );
  }

  TextField _buildAppBarTextFormField() {
    return TextField(
      autofocus: true,
      onSubmitted: (girilenDeger) {
        if (girilenDeger.isNotEmpty) {
          kullanicininGirdigiSehir = girilenDeger;
          context
              .read<WeatherAppCubit>()
              .listeyiYukle(kullanicininGirdigiSehir);
          context
              .read<WeatherForecastCubit>()
              .getWeatherForecastData(kullanicininGirdigiSehir);
        }
      },
      controller: _textController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: "Şehir seçin",
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }

  Widget _buildBody(double deviceHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<WeatherAppCubit, List<HavaDurumuModel>>(
            builder: (context, bilgiler) {
          if (bilgiler.isNotEmpty) {
            var currentElement = bilgiler[0];
            return _buildListItem(currentElement);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
        const Padding(
          padding:  EdgeInsets.all(8.0),
          child: Text(
            "1 Week Forecast Weather Data",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 16),
          ),
        ),
        Expanded(child:
            BlocBuilder<WeatherForecastCubit, List<WeatherForecastModel>>(
                builder: (context, state) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.length,
              itemBuilder: (context, index) {
                var currentItem = state[index];
                return _buildWeatherForecastItem(currentItem, index);
              });
        }))
      ],
    );
  }

  Widget _buildListItem(HavaDurumuModel currentElement) {
    return SizedBox(
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                  child: Text(
                currentElement.cityName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
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
                    "Temperature: ${currentElement.temp}" "°C",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    "Humidty: ${currentElement.rh}" " %",
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
                    "Last Update: ",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  Text(
                    currentElement.obTime,
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


  Widget _buildWeatherForecastItem(
      WeatherForecastModel currentItem, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WeatherDetailPage(
                      currentElement: currentItem,
                      arananSehir: kullanicininGirdigiSehir,
                      index: index,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                colors: [Colors.blue, Colors.blueGrey, Colors.blueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Constants.weekdays[currentItem.validDate.weekday - 1]
                .substring(0, 3)),
            CachedNetworkImage(
              imageUrl:
                  "https://cdn.weatherbit.io/static/img/icons/${currentItem.weather.icon}.png",
              progressIndicatorBuilder: (context, url, progress) => Center(
                child: CircularProgressIndicator(
                  value: progress.progress,
                ),
              ),
              fit: BoxFit.cover,
            ),
            Text(
                "${currentItem.maxTemp.toInt()}° \t ${currentItem.minTemp.toInt()}°"),
          ],
        ),
      ),
    );
  }
}
