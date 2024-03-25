import 'package:educationapp/core/common/app/providers/tab_navigator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PersistenceView extends StatefulWidget {


  const PersistenceView({this.body, super.key});

  final Widget? body;

  @override
  State<PersistenceView> createState() => _PersistenceViewState();

}

class _PersistenceViewState extends State<PersistenceView>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return widget.body ?? context.watch<TabNavigator>().currentPage.child;

  }

  @override
  bool get wantKeepAlive => true;
}
