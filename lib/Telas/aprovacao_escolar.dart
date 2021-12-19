import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:los_chifrudos/widgets/widgets.dart';
import 'Menu.dart';

class aprovacao extends StatefulWidget {
  @override
  _aprovacaoState createState() => _aprovacaoState();
}

class _aprovacaoState extends State<aprovacao> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.deepPurple,
          drawer: NavDrawer(),
          appBar: AppBar(
            title: Text("Aprovação Escolar"),
            elevation: 0.0,
            bottom: TabBar(
              indicatorColor: Colors.white,
              labelStyle:
                  TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              unselectedLabelColor: Colors.white,
              tabs: <Widget>[Text('Total'), Text('Bairros')],
              onTap: (index) {},
            ),
          ),
          body: TabBarView(children: <Widget>[
            CustomScrollView(
                physics: ClampingScrollPhysics(),
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 30.0),
                    sliver: SliverToBoxAdapter(
                      child: statsgrid(),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 20.0),
                    sliver: SliverToBoxAdapter(child: aprovchart()),
                  )
                ]),
            CustomScrollView(
                physics: ClampingScrollPhysics(),
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 50.0),
                    sliver: SliverToBoxAdapter(
                      child: gridbairro(),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(top: 20.0),
                    sliver: SliverToBoxAdapter(child: aprovchart()),
                  )
                ]),
          ]),
        ));
  }
}
