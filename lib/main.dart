import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'di.dart';
import 'packages/cache/locale_storage.dart';
import 'packages/shared/names/apps_names.dart';

const bool test = false;
const AppsNames appName = AppsNames.sales();
void main() async {
  await Di.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  debugPrint('Token : ${KStorage.i.getToken}');
  //KStorage.i.erase;
  debugPrint('FCMToken : ${KStorage.i.getFcmToken}');
  runApp(const RestartWidget(child: MyApp()));
}


class RestartWidget extends StatefulWidget {
  const RestartWidget({super.key, required this.child});
  final Widget child;
  static void restartApp(BuildContext context) => context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();
  void restartApp() => setState(() => key = UniqueKey());
  @override
  Widget build(BuildContext context) => KeyedSubtree(key: key, child: widget.child);
}
