// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/logic/location/location/location_bloc.dart';
import '../modules/logic/location/location/location_state.dart';
import '../modules/models/location/cities_model.dart';
import '../modules/models/location/countries_model.dart';
import '../shared/localization/trans.dart';
import '../shared/theme/helper.dart';
import 'drop_down.dart';
import 'image_widget.dart';

class CityPickerWidget extends StatelessWidget {
  CityPickerWidget({super.key, required this.onCountryChanged, required this.onCityChanged, this.initialCountry, this.initialCity});

  final Function(CountriesDatum? data) onCountryChanged;
  final Function(CitiesDatum? data) onCityChanged;
  final CountriesDatum? initialCountry;
  CitiesDatum? initialCity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        List countryList = LocationBloc.of(context).countriesModel?.data ?? [];
        List cityList = LocationBloc.of(context).citiesModel?.data ?? [];
        debugPrint('================= ${initialCountry?.id} : ');
        return Column(
          children: [
            KDropdownBtn<CountriesDatum>(
              value: initialCountry,
              title: (state.maybeWhen(orElse: () => false, loading: () => true && LocationBloc.of(context).countriesModel == null)
                  ? Tr.get.loading
                  : initialCountry?.name?.value ?? Tr.get.select_country),
              items: countryList
                  .map(
                    (e) => KHelper.of(context).itemView<CountriesDatum>(
                      itemText: e.name?.value ?? '',
                      value: e,
                      icon: e.flag != null
                          ? KImageWidget(
                              imageUrl: e.flag!,
                              width: 50,
                              height: 30,
                              fit: BoxFit.fitWidth,
                              overrideColor: false,
                            )
                          : null,
                    ),
                  )
                  .toList(),
              onChanged: onCountryChanged,
              validator: (values) {
                if (values == null && initialCountry == null) {
                  return Tr.get.field_required;
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 10),
            KDropdownBtn<CitiesDatum>(
              value: state.maybeWhen(orElse: () => initialCity, loading: () => null),
              isLoading: state.maybeWhen(orElse: () => false, loading: () => true),
              title: state.maybeWhen(orElse: () => Tr.get.select_city, loading: () => Tr.get.loading),
              items: cityList.map((e) => KHelper.of(context).itemView<CitiesDatum>(itemText: e.name?.value ?? '', value: e)).toList(),
              onChanged: onCityChanged,
              validator: (values) {
                if (values == null && initialCity == null) {
                  return Tr.get.field_required;
                } else {
                  return null;
                }
              },
            ),
          ],
        );
      },
    );
  }
}
