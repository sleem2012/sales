import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../../../../views/widgets/loading/loading_overlay.dart';
import '../../../../shared/picker/data/country_search_model/address_result.dart';
import '../../../../shared/picker/view/dialog_picker.dart';
import '../../../logic/branches/get_branches/branches_bloc.dart';
import '../../../logic/branches/get_branches/branches_state.dart';
import '../../../logic/location/location/location_bloc.dart';
import '../../../logic/location/location/location_state.dart';
import '../../../models/branches/branch_model.dart';

class AddNewBranchDialog extends StatefulWidget {
  const AddNewBranchDialog({Key? key, this.branchData}) : super(key: key);
  final BranchData? branchData;

  @override
  State<AddNewBranchDialog> createState() => _AddNewBranchDialogState();
}

class _AddNewBranchDialogState extends State<AddNewBranchDialog> {

  @override
  Widget build(BuildContext context) {
    // BranchesBloc.of(context).setInitial(branchData: widget.branchData);
    return BlocConsumer<BranchesBloc, BranchesState>(
      listener: (context, branchState) {
        branchState.whenOrNull(success: (model) => Nav.back());
      },
      builder: (context, branchState) {
        final BranchesBloc addBranch = BranchesBloc.of(context);
        return Center(
          child: BlocBuilder<LocationBloc, LocationState>(
            builder: (context, locationState) {
              return KLoadingOverlay(
                isLoading: branchState is BranchesStateLoading || LocationBloc.of(context).countriesModel == null,
                child: AddLocationDetails(
                  initialData: widget.branchData == null
                      ? null
                      : AddressResult(
                          latLng: LatLng(
                            double.tryParse(widget.branchData!.addressId!.latitude!)!,
                            double.tryParse(widget.branchData!.addressId!.longitude!)!,
                          ),
                          address: widget.branchData!.addressId!.detailedAddress!,
                          zipcode: widget.branchData!.addressId!.zipcode!,
                          intercome: widget.branchData!.addressId!.intercom,
                          street: widget.branchData!.addressId!.street,
                          floor: widget.branchData!.addressId!.floor,
                          state: widget.branchData!.addressId!.state,
                          building: widget.branchData!.addressId!.building,
                          cityId: widget.branchData!.addressId!.cityId!.id,
                          countryId: widget.branchData!.addressId!.cityId!.countryId!.id!,
                        ),
                  onSave: (value) {
                    addBranch.setLocationData(value!);
                    if (widget.branchData == null) {
                      addBranch.addBranches();
                    } else if (widget.branchData != null) {
                      addBranch.updateBranches(widget.branchData?.id ?? -1);
                    }
                  },
                ),
                // SingleChildScrollView(
                //   padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding),
                //   child: Form(
                //     key: _formKey,
                //     child: Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         const SizedBox(height: 10),
                //         Text(Tr.get.add_location),
                //         const SizedBox(height: 10),
                //         BlocBuilder<GetLocationCubit, GetLocationState>(
                //           builder: (context, state) {
                //             return state is GetLocationLoading
                //                 ? const Center(child: CircularProgressIndicator())
                //                 : KButton(
                //                     title: Tr.get.open_map,
                //                     onPressed: () async {
                //                       await GetLocationCubit.of(context).initLocation().then(
                //                         (value) {
                //                           value.fold((l) => KHelper.showSnackBar(KFailure.toError(l)), (r) => addBranch.selectAddress(context));
                //
                //                           /// if (GetLocationCubit.of(context).currentPosition == null) {
                //                           ///   KHelper.showSnackBar(value.);
                //                           /// } else {
                //                           ///   addBranch.selectAddress(context);
                //                           /// }
                //                         },
                //                       );
                //                     },
                //                   );
                //           },
                //         ),
                //         const SizedBox(height: 10),
                //         StatefulBuilder(
                //           builder: (context, setState) => Column(
                //             children: [
                //               const SizedBox(height: 10),
                //               KTextFormField(
                //                 enabled: false,
                //                 controller: addBranch.detailedAddressController,
                //                 hintText: Tr.get.address,
                //                 validator: (value) {
                //                   if (value!.isEmpty) {
                //                     return Tr.get.field_required;
                //                   }
                //                   return null;
                //                 },
                //               ),
                //             ],
                //           ),
                //         ),
                //         const SizedBox(height: 10),
                //         KTextFormField(
                //           controller: addBranch.countryController,
                //           hintText: Tr.get.state,
                //           validator: (value) {
                //             if (value!.isEmpty) {
                //               return Tr.get.field_required;
                //             }
                //             return null;
                //           },
                //         ),
                //         const SizedBox(height: 10),
                //         KTextFormField(
                //           controller: addBranch.stateController,
                //           hintText: Tr.get.state,
                //           validator: (value) {
                //             if (value!.isEmpty) {
                //               return Tr.get.field_required;
                //             }
                //             return null;
                //           },
                //         ),
                //         SizedBox(height: KHelper.height * .01),
                //         KTextFormField(
                //           controller: addBranch.streetController,
                //           hintText: Tr.get.street,
                //           validator: (value) {
                //             if (value!.isEmpty) {
                //               return Tr.get.field_required;
                //             }
                //             return null;
                //           },
                //         ),
                //         const SizedBox(height: 10),
                //         KTextFormField(
                //           controller: addBranch.zipcodeController,
                //           hintText: Tr.get.zipcode,
                //           validator: (value) {
                //             if (value!.isEmpty) {
                //               return Tr.get.field_required;
                //             }
                //             return null;
                //           },
                //         ),
                //         const SizedBox(height: 10),
                //         KTextFormField(
                //           controller: addBranch.buildingController,
                //           hintText: Tr.get.building,
                //           validator: (value) {
                //             if (value!.isEmpty) {
                //               return Tr.get.building_validation;
                //             }
                //             return null;
                //           },
                //         ),
                //         SizedBox(height: KHelper.height * .01),
                //         KTextFormField(
                //           controller: addBranch.intercomController,
                //           hintText: Tr.get.intercom,
                //           validator: (value) {
                //             if (value!.isEmpty) {
                //               return Tr.get.field_required;
                //             }
                //             return null;
                //           },
                //         ),
                //         const SizedBox(height: 10),
                //         KTextFormField(
                //           controller: addBranch.floorController,
                //           hintText: Tr.get.floor,
                //           validator: (value) {
                //             if (value!.isEmpty) {
                //               return Tr.get.field_required;
                //             }
                //             return null;
                //           },
                //         ),
                //         const SizedBox(height: 10),
                //         KButton(
                //           title: Tr.get.save,
                //           onPressed: () {
                //             if (_formKey.currentState!.validate() && widget.branchData == null) {
                //               addBranch.addBranches();
                //             } else if (widget.branchData != null) {
                //               addBranch.updateBranches();
                //             }
                //           },
                //         ),
                //         const SizedBox(height: 30),
                //       ],
                //     ),
                //   ),
                // ),
              );
            },
          ),
        );
      },
    );
  }
}
