import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common_views/local_asset_image.dart';
import 'package:weather_app/data/utils/color_utils.dart';
import 'package:weather_app/data/utils/constant_utils.dart';
import 'package:weather_app/data/utils/image_utils.dart';
import 'package:weather_app/module/provider/pick_location_provider.dart';
import 'package:weather_app/module/views/location_details_view.dart';

class PickLocationView extends StatelessWidget {
  const PickLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PickLocationProvider>(context);
    return Scaffold(
        backgroundColor: DARK_BLUE,
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'City List',
            style: h4_dark(context)?.copyWith(color: WHITE),
          ),
        ),
        body: _mainChild(context: context, provider: provider));
  }

  Widget _mainChild(
          {required BuildContext context,
          required PickLocationProvider provider}) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _searchBox(context: context, provider: provider),
            SPACING_SMALL_HEIGHT,
            Expanded(
              child: ListView.builder(
                  itemCount: provider.searchListItem.length,
                  itemBuilder: (context, i) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0.0, vertical: 10),
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LocationDetailsView(
                                        city: provider.searchListItem[i],
                                      ))),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Color.fromARGB(28, 19, 18, 18)),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CROSS_AXIS_START,
                                  children: [
                                    Text(
                                      '${provider.searchListItem[i]}, India',
                                      style: h4_dark(context)
                                          ?.copyWith(color: WHITE),
                                    ),
                                  ],
                                ),
                                SPACER,
                                const LocalAssetImage(
                                  assetPath: WEATHER_IMG,
                                  height: 50,
                                  width: 100,
                                  boxFit: BoxFit.contain,
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
            )
          ],
        ),
      );

  Widget _searchBox(
          {required BuildContext context,
          required PickLocationProvider provider}) =>
      TextFormField(
        controller: provider.searchController,
        decoration: InputDecoration(
          errorMaxLines: 5,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(width: 0.5, color: ICON_GREY)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:
                  const BorderSide(width: 0.5, color: DARK_BLUE_WITH_OPACITY)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:
                  const BorderSide(width: 0.5, color: DARK_BLUE_WITH_OPACITY)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide:
                  const BorderSide(width: 0.5, color: DARK_BLUE_WITH_OPACITY)),
          labelStyle: const TextStyle(color: TEXT_HEADING, fontSize: 14),
          hintStyle: h4_dark(context)?.copyWith(fontSize: 14, color: WHITE),
          hintText: 'Search for a City',
          prefixIcon: const Icon(
            Icons.search,
            color: WHITE,
          ),
          prefixIconColor: DARK_BLUE,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        ),
        onChanged: (value) {
          provider.searchList();
        },
        onFieldSubmitted: (value) {
          provider.searchList();
        },
      );
}
