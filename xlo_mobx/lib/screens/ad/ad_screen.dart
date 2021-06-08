import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:xlo_mobx/models/ad.dart';
import 'package:xlo_mobx/screens/ad/components/main_panel.dart';

class AdScreen extends StatelessWidget {
  const AdScreen(this.ad, {Key key}) : super(key: key);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Anúncio'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 280,
            child: Carousel(
              images: ad.images
                  .map((url) => CachedNetworkImageProvider(url))
                  .toList(),
              dotSize: 4,
              dotBgColor: Colors.transparent,
              dotColor: Colors.orange,
              autoplay: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MainPanel(ad),
                Divider(color: Colors.grey[500]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
