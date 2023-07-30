import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'drop_down.dart';
import '../modules/logic/location/location/location_bloc.dart';
import '../modules/logic/location/location/location_state.dart';
import '../modules/models/location/countries_model.dart';
import '../shared/localization/trans.dart';
import '../shared/theme/helper.dart';
import 'image_widget.dart';

class NationalityDropDown extends StatelessWidget {
  const NationalityDropDown({super.key, required this.onChanged});
  final Function(CountriesDatum?) onChanged;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        final countryList = LocationBloc.of(context).countriesModel?.data ?? [];
        return KDropdownBtn<CountriesDatum>(
          title: state.maybeWhen(orElse: () => false, loading: () => true && LocationBloc.of(context).countriesModel == null) ? Tr.get.loading : Tr.get.select_nationality,
          //btnDecoration: KHelper.of(context).filled,
          items: countryList
              .map(
                (e) => KHelper.of(context).itemView<CountriesDatum>(
                  itemText: e.nationality?.value ?? '',
                  value: e,
                  icon: e.flag != null ? KImageWidget(imageUrl: e.flag!, width: 50, height: 30, fit: BoxFit.contain, overrideColor: false) : null,
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
          validator: (values) {
            if (values == null && Platform.isAndroid) {
              return Tr.get.field_required;
            } else {
              return null;
            }
          },
          showAz: true,
        );
      },
    );
  }
}
