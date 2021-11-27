import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/export_utilities.dart';

class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.close,
            color: Colour.black,
          ),
        ),
        title: const SubHeading2(
          'Sort / Filter',
          size: 18,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16.0),
              child: SubHeading2(
                'CLEAR ALL',
                size: 14,
                fontWeight: FontWeight.w500,
                color: Colour.greenishBlue,
              ),
            ),
          )
        ],
      ),
      body: const _FilterWidget(),
    );
  }
}

class _FilterWidget extends StatefulWidget {
  const _FilterWidget({Key? key}) : super(key: key);

  @override
  State<_FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<_FilterWidget> {
  int _selectedIndex = 0;

  void onTileTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colour.offWhite,
              child: Column(
                children: <Widget>[
                  ...ListTile.divideTiles(
                    context: context,
                    tiles: <Widget>[
                      CustomListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 6),
                        onTap: () {
                          onTileTap(0);
                        },
                        backgroundColor: _selectedIndex == 0
                            ? Colour.white
                            : Colour.transparent,
                        title: SubHeading2(
                          'Sort',
                          fontWeight: _selectedIndex == 0
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      CustomListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 6),
                        onTap: () {
                          onTileTap(1);
                        },
                        backgroundColor: _selectedIndex == 1
                            ? Colour.white
                            : Colour.transparent,
                        title: SubHeading2(
                          'Category',
                          fontWeight: _selectedIndex == 1
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      CustomListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 6),
                        onTap: () {
                          onTileTap(2);
                        },
                        backgroundColor: _selectedIndex == 2
                            ? Colour.white
                            : Colour.transparent,
                        title: SubHeading2(
                          'Brand',
                          fontWeight: _selectedIndex == 2
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      CustomListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 6),
                        onTap: () {
                          onTileTap(3);
                        },
                        backgroundColor: _selectedIndex == 3
                            ? Colour.white
                            : Colour.transparent,
                        title: SubHeading2(
                          'Price Range',
                          fontWeight: _selectedIndex == 3
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const VerticalDivider(thickness: 1, width: 1),
          if (_selectedIndex == 0) const _SortFilterOptions(),
          if (_selectedIndex == 1) const _CategoryFilterOption(),
          if (_selectedIndex == 3) const _PriceCategoryOptions()
        ],
      ),
    );
  }
}

class _PriceCategoryOptions extends StatefulWidget {
  const _PriceCategoryOptions({
    Key? key,
  }) : super(key: key);

  @override
  State<_PriceCategoryOptions> createState() => _PriceCategoryOptionsState();
}

class _PriceCategoryOptionsState extends State<_PriceCategoryOptions> {
  RangeValues _currentRangeValues = const RangeValues(200, 1000);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SubHeading2(
                'Select Price Range',
                size: 14,
                fontWeight: FontWeight.bold,
                color: Colour.lightGrey,
              ),
              sizedBoxHeight(20),
              SubHeading2(
                '${Constants.rupee}${_currentRangeValues.start.ceil()} - ${Constants.rupee}${_currentRangeValues.end.ceil()}',
                size: 16,
                fontWeight: FontWeight.bold,
                color: Colour.black,
              ),
              sizedBoxHeight(10),
              RangeSlider(
                inactiveColor: Colour.lightGrey.withOpacity(0.5),
                activeColor: Colour.greenishBlue,
                values: _currentRangeValues,
                min: 200,
                max: 1000,
                divisions: 1000,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              )
            ],
          ),
        ));
  }
}

class _CategoryFilterOption extends StatelessWidget {
  const _CategoryFilterOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SubHeading2(
              'Show Category By',
              size: 14,
              fontWeight: FontWeight.bold,
              color: Colour.lightGrey,
            ),
            sizedBoxHeight(20),
            CustomListTile(
              leading: const CustomImageWidget(
                image: Assets.uncheck,
                scale: 2,
              ),
              title: SubHeading2(
                'Beer',
                fontWeight: FontWeight.w500,
                color: Colour.lightGrey.withOpacity(0.8),
              ),
            ),
            sizedBoxHeight(20),
            CustomListTile(
              leading: const CustomImageWidget(
                image: Assets.check,
                scale: 1.5,
              ),
              title: SubHeading2(
                'Champagne',
                fontWeight: FontWeight.w500,
                color: Colour.lightGrey.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SortFilterOptions extends StatelessWidget {
  const _SortFilterOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SubHeading2(
              'Show Sort By',
              size: 14,
              fontWeight: FontWeight.bold,
              color: Colour.lightGrey,
            ),
            sizedBoxHeight(20),
            CustomListTile(
              leading: const CustomImageWidget(
                image: Assets.unradio,
                scale: 2,
              ),
              title: SubHeading2(
                "What's New",
                fontWeight: FontWeight.w500,
                color: Colour.lightGrey.withOpacity(0.8),
              ),
            ),
            sizedBoxHeight(20),
            const CustomListTile(
              leading: CustomImageWidget(
                image: Assets.radio,
                scale: 2,
              ),
              title: SubHeading2('Price - Low to High'),
            ),
            sizedBoxHeight(20),
            const CustomListTile(
              leading: CustomImageWidget(
                image: Assets.unradio,
                scale: 2,
              ),
              title: SubHeading2('Price - High to Low'),
            ),
            sizedBoxHeight(20),
            const CustomListTile(
              leading: CustomImageWidget(
                image: Assets.unradio,
                scale: 2,
              ),
              title: SubHeading2('Discount'),
            ),
            sizedBoxHeight(20),
            const CustomListTile(
              leading: CustomImageWidget(
                image: Assets.unradio,
                scale: 2,
              ),
              title: SubHeading2('Popularity'),
            ),
          ],
        ),
      ),
    );
  }
}
