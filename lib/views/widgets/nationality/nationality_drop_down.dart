import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../packages/modules/logic/location/location/location_bloc.dart';
import '../../../packages/modules/logic/location/location/location_state.dart';
import '../../../packages/modules/models/location/countries_model.dart';
import '../../../packages/shared/localization/trans.dart';
import '../../../packages/shared/theme/helper.dart';
import '../../../packages/widgets/drop_down.dart';
import '../../../packages/widgets/image_widget.dart';

class NationalityDropDown extends StatelessWidget {


  const NationalityDropDown({super.key, required this.onChanged, this.initValue});
  final Function(CountriesDatum?) onChanged;
 final CountriesDatum? initValue;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        final countryList = LocationBloc.of(context).countriesModel?.data ?? [];
        return KDropdownBtn<CountriesDatum>(
          title: state.maybeWhen(orElse: () => false, loading: () => true && LocationBloc.of(context).countriesModel == null)
              ? Tr.get.loading
              : Tr.get.select_nationality,
            value: initValue,
          items: countryList
              .map(
                (e) => KHelper.of(context).itemView<CountriesDatum>(
                  itemText: e.nationality?.value ?? '',
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
