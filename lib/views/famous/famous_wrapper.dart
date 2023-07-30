import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di.dart';
import '../../logic/famous/get_famous/get_famous_bloc.dart';
import '../../logic/famous/get_famous/get_famous_state.dart';
import '../main_screen/main_screen.dart';
import '../widgets/error/error_widget.dart';
import '../widgets/loading/loading_overlay.dart';

import 'add_famous_view_attributes.dart';

class FamousWrapper extends StatelessWidget {
  const FamousWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => Di.getFamous..getFamous(),
        child: BlocBuilder<GetFamousBloc, GetFamousState>(
          builder: (context, state) {
            final famous = GetFamousBloc.of(context).famousModel;
            return state.maybeWhen(
              orElse: () {
                if (famous?.data?.isEmpty ?? false) {
                  return const AddFamousAttributesView();
                } else {
                  if(famous?.data?.first.state=="joined"){
                    return const MainNavpages();
                  }
                  else {
                    return const AddFamousAttributesView();
                  }
                }
              },
              loading: () => const KLoadingOverlay(isLoading: true),
              error: (error) => KErrorWidget(
                error: state.whenOrNull(error: (error) => error),
                isError: true,
                onTryAgain: GetFamousBloc.of(context).getFamous,
              ),

            );
          },
        ),
      ),
    );
  }
}
