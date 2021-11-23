import 'package:flutter/material.dart';
import '../../utils/widgets/app_bar.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/widgets/custom_image_widget.dart';
import '../../utils/widgets/product_card.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: appBar(
          context,
          title: 'Beer',
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              color: Colour.white,
              icon: const Padding(
                padding: EdgeInsets.all(6.0),
                child: CustomImageWidget(
                  image: Assets.search1,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              color: Colour.white,
              icon: const Padding(
                padding: EdgeInsets.all(6.0),
                child: CustomImageWidget(
                  image: Assets.filter,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: const <Widget>[
            _Tabs(),
            _TabView(),
          ],
        ),
      ),
    );
  }
}

class _TabView extends StatelessWidget {
  const _TabView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: <Widget>[
          GridView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.55,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const ProductCard();
            },
          ),
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      elevation: 5,
      child: TabBar(
        isScrollable: true,
        indicatorColor: Colour.greenishBlue,
        indicatorWeight: 3,
        labelPadding: EdgeInsets.symmetric(horizontal: 20),
        labelColor: Colour.greenishBlue,
        unselectedLabelColor: Colour.black,
        tabs: <Widget>[
          Tab(
            text: 'MILD BEER',
          ),
          Tab(
            text: 'MILD BEER',
          ),
          Tab(
            text: 'BREEZER',
          ),
          Tab(
            text: 'STRONG BEER',
          ),
          Tab(
            text: 'WINE',
          ),
        ],
      ),
    );
  }
}
