import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/myads/components/active_tile.dart';
import 'package:xlo_mobx/stores/myads_store.dart';

class MyAdsScreen extends StatefulWidget {
  MyAdsScreen({Key key}) : super(key: key);

  @override
  _MyAdsScreenState createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen>
    with SingleTickerProviderStateMixin {
  final MyAdsStore store = MyAdsStore();

  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Anúncios'),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.orange,
          tabs: [
            Tab(child: Text('ATIVOS')),
            Tab(child: Text('PENDENTES')),
            Tab(child: Text('VENDIDOS')),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Observer(builder: (_) {
            if (store.activeAds.isEmpty) return Container();

            return ListView.builder(
                itemCount: store.activeAds.length,
                itemBuilder: (_, index) {
                  return ActiveTile(store.activeAds[index]);
                });
          }),
          Container(color: Colors.yellow),
          Container(color: Colors.green),
        ],
      ),
    );
  }
}
