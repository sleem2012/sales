import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/localization/trans.dart';
import '../../../shared/theme/helper.dart';
import '../../models/currencies/currencies_model.dart';
import '../../logic/currencies/currencies_bloc.dart';
import '../../logic/currencies/currencies_state.dart';

import '../../../widgets/drop_down.dart';

class CurrenciesDropdown extends StatelessWidget {
  final Function(CurrenciesData?) onSelect;
  const CurrenciesDropdown({Key? key, required this.onSelect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrenciesBloc, CurrenciesState>(
      builder: (context, state) {
        final currency = state.maybeWhen(orElse: () => <CurrenciesData>[], success: (model) => model.data!);
        return Column(
          children: [
            KDropdownBtn<CurrenciesData>(
              onChanged: onSelect,
              
              isLoading: state.whenOrNull(loading: () => true) ?? false,
              items: currency.map((e) => KHelper.of(context).itemView<CurrenciesData>(itemText: "${e.name?.value}", value: e)).toList(),
              title: state.maybeWhen(orElse: () => false, loading: () => true) ? Tr.get.loading : Tr.get.select_currency,
              value: CurrenciesBloc.of(context).initCurency,
            ),
            if (state.maybeWhen(orElse: () => false, error: (e) => true))
              TextButton(
                onPressed: CurrenciesBloc.of(context).getCurrencies,
                child: Text(Tr.get.try_again),
              ),
          ],
        );
      },
    );
  }
}
