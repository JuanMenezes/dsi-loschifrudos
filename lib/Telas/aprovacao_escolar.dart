import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:los_chifrudos/widgets/statsgrid.dart';
import 'package:los_chifrudos/widgets/widgets.dart';
import 'Menu.dart';


class aprovacao extends StatefulWidget {
  @override
  _aprovacaoState createState() => _aprovacaoState();
}

class _aprovacaoState extends State<aprovacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text("Aprovação Escolar"),
        elevation: 0.0,
      ),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildyear(),
          _buildstats(),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            sliver: SliverToBoxAdapter(
              child: statsgrid(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(child: aprovchart()),
          )
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildyear() {
    return SliverToBoxAdapter(
      child: DefaultTabController(
          length: 2,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40.0),
            height: 50.0,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: TabBar(
              indicator: BubbleTabIndicator(
                  tabBarIndicatorSize: TabBarIndicatorSize.tab,
                  indicatorHeight: 40.0,
                  indicatorColor: Colors.white),
              labelStyle:
                  TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              labelColor: Colors.deepPurple,
              unselectedLabelColor: Colors.white,
              tabs: <Widget>[Text("2017"), Text("2018")],
              onTap: (index) {},
            ),
          )),
    );
  }

  SliverPadding _buildstats() {
    return SliverPadding(
      padding: const EdgeInsets.all(20.0),
      sliver: SliverToBoxAdapter(
        child: DefaultTabController(
            length: 2,
            child: TabBar(
                indicatorColor: Colors.transparent,
                labelStyle:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                unselectedLabelColor: Colors.white60,
                tabs: <Widget>[Text('Total'), Text('Bairros')],
                onTap: (index) {})),
      ),
    );
  }
}
