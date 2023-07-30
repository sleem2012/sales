import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../packages/cache/locale_storage.dart';
import '../../packages/shared/theme/helper.dart';

@immutable
class MainViewState {
  final int index;

  const MainViewState({required this.index});
}

class MainViewBloc extends Cubit<MainViewState> {
  MainViewBloc() : super(const MainViewState(index: 0));

  static MainViewBloc of(BuildContext context) {
    return BlocProvider.of<MainViewBloc>(context);
  }

  PageController pageCtrl = PageController();

  void navTaped(int page) {
    if (page != pageCtrl.page?.toInt()) {
      pageCtrl.jumpToPage(page);
      // pageCtrl.animateToPage(page, duration: const Duration(milliseconds: 450), curve: Curves.easeOutCubic);
    }
    emit(MainViewState(index: page));
  }

  List<IconData> navItems = [
    KHelper.home,
    if (KStorage.i.getUserInfo?.data?.type?.id != 1) KHelper.money,
    KHelper.chats,
    KHelper.person,
  ];
}
