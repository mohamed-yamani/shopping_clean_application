import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';

class WirdashApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;
  const WirdashApp({Key? key, required this.navigatorKey, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
        projectId: 'getshop-qsbxpw8',
        secret: 'U7XzAY9rNSpCsQNU7u63YAzUfDcdbiM5',
        navigatorKey: navigatorKey,
        child: child,
        options: WiredashOptionsData(
          bugReportButton: false,
        ),
        theme: WiredashThemeData(
          brightness: Brightness.dark,
        ));
  }
}
