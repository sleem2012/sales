// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/branch_staff/vendors_model.dart';
import '../../data/repository/search/search_repo.dart';
import '../../packages/modules/models/company/company_model.dart';
import '../../packages/shared/localization/trans.dart';
import '../../views/widgets/slug_drop_down.dart';

import '../../../../packages/shared/error/failures.dart';
import 'search_company_event.dart';

class SearchCompanyBloc extends Cubit<SearchState> {
  SearchCompanyBloc({required this.searchRepoImpl}) : super(const SearchState.initial()) {
    // on<SearchEventSearch>(_handelSearch);
    // on<SearchEventApi>(_search);
  }

  static SearchCompanyBloc of(context) => BlocProvider.of(context);

  final SearchRepoImpl searchRepoImpl;

  // List<BlocEventState<SearchEvent, SearchState>> stateEvents = [];

  // List<dynamic> data = [];

  // final _deBouncer = DeBouncer(200);

  KSlugModel? searchType;
  TextEditingController searchController = TextEditingController();

  setSearchType({required KSlugModel type}) {
    searchType = type;
  }

  // bool fromSearch=false;
  // setFromSearch( bool from){
  //   fromSearch=from;
  // }

  List<CompanyOwner> userData = [];

  List<VendorsModel> company = [];

  search(String text, String type) async {
    // userData = [];
    // company = [];
    try {
      emit(const SearchState.loading());
      final result = await searchRepoImpl.search(text: text, type: type);
      result.fold(
        (l) {
          emit(SearchState.error(error: KFailure.toError(l)));
          debugPrint('================= _search (Bloc) : $l');
        },
        (r) {
          if (type == KSlugModel.user) {
            userData = r.map((e) => CompanyOwner.fromJson(e)).toList();
          } else {
            company = r.map((e) => VendorsModel.fromJson(e)).toList();
          }

          emit(const SearchState.success());
        },
      );
    } catch (e) {
      debugPrint('================= _search (Bloc) (catch) : $e  ');
      emit(SearchState.error(error: Tr.get.something_went_wrong));
      rethrow;
    }
  }
}
