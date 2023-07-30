// ignore_for_file: unused_element, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/localization/trans.dart';
import '../shared/theme/colors.dart';
import '../shared/theme/helper.dart';
import 'text_field.dart';

class SearchState<T> {
  const SearchState(this.list);

  final List<T> list;
}

class SearchCubit<T> extends Cubit<SearchState<T>> {
  SearchCubit(this._list) : super(SearchState(_list)) {
    _filteredList = this._list;
  }

  static SearchCubit<T> of<T>(BuildContext context) {
    return BlocProvider.of<SearchCubit<T>>(context);
  }

  updateList(List<T> list) {
    _list = list;
    _filteredList = list;
    emit(SearchState(_filteredList));
  }

  List<T> _list;
  List<T> _filteredList = [];

  List<T> get filteredList => _filteredList;

  get isSearching => _isSearching;
  bool _isSearching = false;

  search(String qry, String? Function(T) where) {
    if (qry.isEmpty) {
      _isSearching = false;
      _filteredList = _list;
      emit(SearchState(_filteredList));
      return;
    }
    _isSearching = true;
    qry = qry.toUpperCase();
    final result = <_ItemSimilarity<T>>[];
    for (var element in _list) {
      final searchIn = where.call(element)?.toUpperCase();
      final similarity = stringSimilarity(qry, searchIn ?? '');
      if ((searchIn?.characters.containsAll(qry.characters) ?? false) || similarity > 0.30) {
        result.add(_ItemSimilarity(element, similarity));
        if (similarity > 0.00 || (searchIn?.contains(qry) ?? false)) {}
      }
    }
    result
      ..sort((a, b) => b.similarity.compareTo(a.similarity))
      ..sort((a, b) => (where.call(b.item)?.contains(qry) == true ? 1 : 0).compareTo(where.call(a.item)?.contains(qry) == true ? 1 : 0));

    _filteredList = result.map((e) => e.item).toList();
    emit(SearchState(_filteredList));
  }

  int _levenshtein(String s, String t) {
    var m = s.length, n = t.length;
    var d = List.generate(m + 1, (_) => List.generate(n + 1, (_) => 0));

    for (var i = 1; i <= m; i++) {
      d[i][0] = i;
    }
    for (var j = 1; j <= n; j++) {
      d[0][j] = j;
    }

    for (var j = 1; j <= n; j++) {
      for (var i = 1; i <= m; i++) {
        if (s[i - 1] == t[j - 1]) {
          d[i][j] = d[i - 1][j - 1];
        } else {
          d[i][j] = [d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + 1].reduce((a, b) => a < b ? a : b);
        }
      }
    }

    return d[m][n];
  }

  double stringSimilarity(String s1, String s2) {
    var maxLen = s1.length > s2.length ? s1.length : s2.length;
    if (maxLen == 0) return 1.0;
    var distance = _levenshtein(s1, s2);
    return (maxLen - distance) / maxLen;
  }

  /// double _similarityByAcy(String a, String b) {
  ///   int semi = 0;
  ///   int maxContinuos = 0;

  ///   a = a.toUpperCase();
  ///   b = b.toUpperCase();
  ///   // final bSet = b.characters.toSet();
  ///   String subQ = '';
  ///   for (var chA in a.characters) {
  ///     subQ += chA;
  ///     if (b.contains(chA)) {
  ///       semi += 1;
  ///     }
  ///     if (b.contains(subQ)) {
  ///       maxContinuos = subQ.length;
  ///     }
  ///   }
  ///   debugPrint(' *****  $b =>>> Max Continuos = $maxContinuos $a  $subQ  ,,    $semi    ,,   ${(semi / b.length * 100).toInt()} ');
  ///   return semi <= 0 ? 0 : (semi / b.length);
  /// }
}

class _ItemSimilarity<T> {
  final T item;
  final double similarity;

  _ItemSimilarity(this.item, this.similarity);
}

/////////////////////////////////////////////////////
class SearchableView<T> extends StatefulWidget {
  const SearchableView({
    super.key,
    required this.initialList,
    this.strategy = SearchStrategyEnum.levenshtein,
    required this.where,
    required this.whereList,
    required this.builder,
    this.suffixIcon,
    this.onFocus,
  });

  final List<T> initialList;
  final SearchStrategyEnum strategy;
  final String? Function(T item) where;
  final List<String> Function(T item) whereList;
  final void Function()? onFocus;
  final Widget Function(List<T> list, bool isSearching) builder;
  final Widget? suffixIcon;

  @override
  State<SearchableView<T>> createState() => _SearchableViewState<T>();
}

class _SearchableViewState<T> extends State<SearchableView<T>> {
  @override
  void initState() {
    super.initState();
    late SearchStrategy strategy;
    switch (widget.strategy) {
      case SearchStrategyEnum.levenshtein:
        strategy = LevenshteinSearch.instance;
        break;
    }
    ctrl = SearchableCtrl(widget.initialList, strategy);
  }

  late SearchableCtrl<T> ctrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SearchBar(
          suffixIcon: widget.suffixIcon,
          onTap: widget.onFocus,
          onSearch: (p0) {
            setState(() {
              ctrl.search(p0, widget.where);
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        widget.builder.call(ctrl.filteredList, ctrl.isSearching)
      ],
    );
  }
}

class SearchableCtrl<T> {
  SearchableCtrl(this.list, this.strategy) {
    _filteredList = list;
  }

  final List<T> list;
  final SearchStrategy strategy;
  List<T> _filteredList = [];

  List<T> get filteredList => _filteredList;

  get isSearching => _isSearching;
  bool _isSearching = false;

  List<T> search(String qry, String? Function(T) where) {
    if (qry.isEmpty) {
      _isSearching = false;
      _filteredList = list;
      return _filteredList;
    }
    _isSearching = true;
    qry = qry.toUpperCase();
    final result = <_ItemSimilarity<T>>[];
    for (var element in list) {
      final searchIn = where.call(element)?.toUpperCase();
      final similarity = strategy.similarity(qry, searchIn ?? '');
      if ((searchIn?.characters.containsAll(qry.characters) ?? false) || similarity > 0.30) {
        result.add(_ItemSimilarity(element, similarity));
        if (similarity > 0.00 || (searchIn?.contains(qry) ?? false)) {}
      }
    }
    result
      ..sort((a, b) => b.similarity.compareTo(a.similarity))
      ..sort((a, b) => (where.call(b.item)?.contains(qry) == true ? 1 : 0).compareTo(where.call(a.item)?.contains(qry) == true ? 1 : 0));

    _filteredList = result.map((e) => e.item).toList();

    return _filteredList;
  }

  /// List<T> searchWL(String qry, List<String> Function(T) where) {
  ///   if (qry.isEmpty) {
  ///     _isSearching = false;
  ///     _filteredList = list;
  ///     return _filteredList;
  ///   }
  ///   _isSearching = true;
  ///   qry = qry.toUpperCase();
  ///   final result = <_ItemSimilarity<T>>[];
  ///   for (var element in list) {
  ///     final searchIn = where.call(element)..forEach((element) {});
  ///     final similarity = strategy.similarity(qry, searchIn ?? '');
  ///     if ((searchIn?.characters.containsAll(qry.characters) ?? false) || similarity > 0.30) {
  ///       result.add(_ItemSimilarity(element, similarity));
  ///       if (similarity > 0.00 || (searchIn.contains(qry) ?? false)) {}
  ///     }
  ///   }
  ///   result
  ///     ..sort((a, b) => b.similarity.compareTo(a.similarity))
  ///     ..sort((a, b) => (where.call(b.item).contains(qry) == true ? 1 : 0).compareTo(where.call(a.item).contains(qry) == true ? 1 : 0));

  ///   _filteredList = result.map((e) => e.item).toList();

  ///   return _filteredList;
  /// }
}

abstract class SearchStrategy {
  double similarity(String s1, String s2);
}

class LevenshteinSearch implements SearchStrategy {
  static LevenshteinSearch? _instance;

  LevenshteinSearch._internal() {
    _instance = this;
  }

  static LevenshteinSearch get instance {
    return _instance ?? LevenshteinSearch._internal();
  }

  int _levenshtein(String s, String t) {
    var m = s.length, n = t.length;
    var d = List.generate(m + 1, (_) => List.generate(n + 1, (_) => 0));

    for (var i = 1; i <= m; i++) {
      d[i][0] = i;
    }
    for (var j = 1; j <= n; j++) {
      d[0][j] = j;
    }

    for (var j = 1; j <= n; j++) {
      for (var i = 1; i <= m; i++) {
        if (s[i - 1] == t[j - 1]) {
          d[i][j] = d[i - 1][j - 1];
        } else {
          d[i][j] = [d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + 1].reduce((a, b) => a < b ? a : b);
        }
      }
    }

    return d[m][n];
  }

  @override
  double similarity(String s1, String s2) {
    var maxLen = s1.length > s2.length ? s1.length : s2.length;
    if (maxLen == 0) return 1.0;
    var distance = _levenshtein(s1, s2);
    return (maxLen - distance) / maxLen;
  }
}

enum SearchStrategyEnum { levenshtein }

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key, this.onSearch, this.color, this.onTap, this.suffixIcon}) : super(key: key);
  final void Function(String)? onSearch;
  final void Function()? onTap;
  final Color? color;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: KHelper.hPadding, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: KTextFormField(
              hintText: Tr.get.search,
              onTap: onTap,
              onChanged: onSearch,
              textInputAction: TextInputAction.search,
              fillColor: color,
              prefixIcon: Icon(KHelper.search, color: KColors.of(context).accentColor),
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}
