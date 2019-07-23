import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  Provider({
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  final bloc = Bloc();

  static Bloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
  }

  @override
  bool updateShouldNotify(Provider old) {
    return true;
  }
}
