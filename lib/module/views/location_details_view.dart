import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common_views/local_asset_image.dart';
import 'package:weather_app/data/utils/color_utils.dart';
import 'package:weather_app/data/utils/constant_utils.dart';
import 'package:weather_app/data/utils/image_utils.dart';
import 'package:weather_app/module/provider/location_details_provider.dart';

class LocationDetailsView extends StatelessWidget {
  final String city;
  const LocationDetailsView({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocationDetailsProvider(city),
      child: Consumer<LocationDetailsProvider>(
        builder: (context, locationDetailsProvider, __) => WillPopScope(
          onWillPop: () async {
            Navigator.pop(context);
            return false;
          },
          child: Scaffold(
            backgroundColor: DARK_BLUE,
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: WHITE,
                ),
              ),
              centerTitle: false,
              title: Text(
                'Weather Info',
                style: h3_dark(context)?.copyWith(color: WHITE),
              ),
            ),
            body: Center(
              child: _mainChild(
                  context: context, provider: locationDetailsProvider),
            ),
          ),
        ),
      ),
    );
  }

  Widget _mainChild(
      {required BuildContext context,
      required LocationDetailsProvider provider}) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: provider.loading
              ? const LoadingWidget()
              : Column(
                  mainAxisAlignment: MAIN_AXIS_CENTER,
                  crossAxisAlignment: CROSS_AXIS_CENTER,
                  children: [
                    Text(
                      provider.locationDetails!.name,
                      style: h3_dark(context)
                          ?.copyWith(color: WHITE, fontSize: 25),
                    ),
                    SPACING_VSMALL_HEIGHT,
                    Text(
                      provider.locationDetails!.weather.first.main,
                      style: h4_dark(context)?.copyWith(color: WHITE),
                    ),
                    SPACING_SMALL_HEIGHT,
                    LocalAssetImage(
                      assetPath: provider.locationDetails!.weather.first.main
                              .contains('Rain')
                          ? RAINY_IMG
                          : provider.locationDetails!.weather.first.main
                                  .contains('Mist')
                              ? SNOWY_IMG
                              : provider.locationDetails!.weather.first.main
                                      .contains('snowy')
                                  ? SNOWY_IMG
                                  : CLOUDY_IMG,
                      height: 200,
                      width: 200,
                      boxFit: BoxFit.contain,
                    ),
                    SPACING_SMALL_HEIGHT,
                    Text(
                      '${provider.locationDetails!.main.temp}°',
                      style: h3_dark(context)?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: WHITE),
                    ),
                    SPACING_MEDIUM_HEIGHT,
                    Row(
                      children: [
                        _rangeUI(
                            context: context,
                            title: 'Min Temp',
                            value: '${provider.locationDetails!.main.tempMin}°',
                            bgColor: LIGHT_BLUE,
                            textColor: BLUE),
                        SPACER,
                        _rangeUI(
                            context: context,
                            title: 'Max Temp',
                            value: '${provider.locationDetails!.main.tempMax}°',
                            bgColor: LIGHT_GREEN,
                            textColor: DARK_GREEN),
                      ],
                    ),
                    SPACING_SMALL_HEIGHT,
                    Row(
                      children: [
                        _rangeUI(
                            context: context,
                            title: 'Humidity',
                            value:
                                '${provider.locationDetails!.main.humidity}°',
                            bgColor: RED_WITH_OPACITY,
                            textColor: APP_COLOR),
                        SPACER,
                        _rangeUI(
                            context: context,
                            title: 'Wind Speed',
                            value: '${provider.locationDetails!.wind.speed}°',
                            bgColor: LIGHT_BLUE,
                            textColor: BLUE),
                      ],
                    )
                  ],
                ),
        ),
      ),
    );
  }

  Widget _rangeUI(
          {required BuildContext context,
          required String title,
          required String value,
          required Color bgColor,
          required Color textColor}) =>
      SizedBox(
        width: 150,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color.fromARGB(28, 19, 18, 18)),
          child: Column(
            crossAxisAlignment: CROSS_AXIS_START,
            children: [
              Text(
                title,
                style: h4_dark(context)?.copyWith(color: CONTAINER_COLOR),
              ),
              SPACING_VSMALL_HEIGHT,
              Text(
                value,
                style: h4_dark(context)
                    ?.copyWith(color: WHITE, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
}

//? loader
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: BLUE,
      ),
    );
  }
}
