import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../logic/nav_enforcer/nav_enforcer_bloc.dart';
import '../../packages/cache/locale_storage.dart';
import '../../packages/shared/localization/trans.dart';
import '../../packages/shared/theme/colors.dart';
import '../../packages/shared/theme/helper.dart';
import '../add_new_employee/add_employee.dart';
import '../famous/add_famous.dart';
import '../sales_delegate/add_vendor.dart';

class SpeedDialWidget extends StatelessWidget {
  SpeedDialWidget({Key? key, this.hero}) : super(key: key);
  final ValueNotifier<bool> isDialOpen = ValueNotifier<bool>(false);
  final bool customDialRoot = false;
  final bool extend = false;
  final String? hero;

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      openCloseDial: isDialOpen,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      direction: SpeedDialDirection.up,
      switchLabelPosition: true,
      closeManually: false,
      elevation: 6.0,
      animationCurve: Curves.easeInOutCirc,
      animationDuration: const Duration(milliseconds: 400),
      isOpenOnStart: false,
      backgroundColor: KColors.of(context).accentColor,
      renderOverlay: true,
      overlayOpacity: 0,
      children: [
        if (KStorage.i.getUserInfo?.data?.type?.actionCollection?.agencies?.add == true)
          SpeedDialChild(
            child: Center(child: SvgPicture.asset("assets/images/Vendor_icon.svg")),
            backgroundColor: KColors.of(context).accentColor,
            foregroundColor: Colors.white,
            label: Tr.get.add_agency,
            onTap: () async {
              await KHelper.showCustomBottomSheet(
                AddVendorView(
                  isAgency: true,
                ),
              );
            },
          ),
        if (KStorage.i.getUserInfo?.data?.type?.actionCollection?.vendors?.add == true)
          SpeedDialChild(
            child: Center(child: SvgPicture.asset("assets/images/Vendor_icon.svg")),
            backgroundColor: KColors.of(context).accentColor,
            foregroundColor: Colors.white,
            label: Tr.get.add_vendor,
            onTap: () async {
              await KHelper.showCustomBottomSheet(
                AddVendorView(
                  isAgency: false,
                ),
              );
            },
          ),
        if (KStorage.i.getUserInfo?.data?.type?.actionCollection?.users?.add == true)
          SpeedDialChild(
            child: Center(child: SvgPicture.asset("assets/images/Employee_icon.svg")),
            backgroundColor: KColors.of(context).accentColor,
            foregroundColor: Colors.white,
            label: Tr.get.add_new_employee,
            onTap: () => Nav.to(const AddNewEmployeeScreen()),
          ),
        if (KStorage.i.getUserInfo?.data?.type?.actionCollection?.famous?.add == true)
          SpeedDialChild(
            child: Center(child: SvgPicture.asset("assets/images/Employee_icon.svg")),
            backgroundColor: KColors.of(context).accentColor,
            foregroundColor: Colors.white,
            label: Tr.get.add_famous,
            onTap: () => KHelper.showCustomBottomSheet(AddFamousView()),
          ),
      ],
    );
  }
}

// class SearchSpeedDialWidget extends StatelessWidget {
//   SearchSpeedDialWidget({Key? key, this.hero}) : super(key: key);
//   final ValueNotifier<bool> isDialOpen = ValueNotifier<bool>(false);
//   final bool customDialRoot = false;
//   final bool extend = false;
//   final String? hero;
//
//   @override
//   Widget build(BuildContext context) {
//     final List<String> searchTypes = ["user", "vendor", "agency"];
//
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: SpeedDial(
//           icon: Icons.search,
//           activeIcon: Icons.search,
//           spacing: 2,
//           openCloseDial: isDialOpen,
//           childPadding: const EdgeInsets.all(5),
//           spaceBetweenChildren: 4,
//           direction: SpeedDialDirection.right,
//           switchLabelPosition: true,
//           closeManually: false,
//           // heroTag: hero??'speed-dial-hero-tag',
//           elevation: 2.0,
//           animationCurve: Curves.easeInOutCirc,
//           animationDuration: const Duration(milliseconds: 400),
//           // useRotationAnimation: true,
//           isOpenOnStart: false,
//           backgroundColor: KColors.of(context).accentColor,
//           renderOverlay: false,
//           children: searchTypes
//               .map(
//                 (e) {
//                   return SpeedDialChild(
//                   child: Center(child: SvgPicture.asset("assets/images/Vendor_icon.svg")),
//                   backgroundColor: KColors.of(context).accentColor,
//                   foregroundColor: Colors.white,
//                   label: e,
//                   onTap: () async {
//                     Nav.to(const GeneralSearchScreen());
//                   },
//                 );
//                 },
//               )
//               .toList()),
//     );
//   }
// }
