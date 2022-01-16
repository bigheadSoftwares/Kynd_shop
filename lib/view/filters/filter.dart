import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/category/sub_category_products_cubit.dart';

import '../../data/filter/selected_filter.dart';
import '../../logic/brands/brands_cubit.dart';
import '../../logic/filter/selected_filter_cubit.dart';
import '../../utils/export_utilities.dart';

class Filter extends StatelessWidget {
  const Filter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            pop(context);
          },
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
        actions: <Widget>[
          InkWell(
            onTap: () {
              context.read<SelectedFilterCubit>().resetFilters();
              BlocProvider.of<SubCategoryProductsCubit>(context)
                  .getSubCategoryProducts(
                subCategoryId:
                    context.read<SelectedFilterCubit>().currentCategoryTabId,
                selectedFilterModel: context.read<SelectedFilterCubit>().state,
              );
            },
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
  const _FilterWidget({
    Key? key,
  }) : super(key: key);

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomButton(
        onTap: () {
          BlocProvider.of<SubCategoryProductsCubit>(context)
              .getSubCategoryProducts(
            subCategoryId:
                context.read<SelectedFilterCubit>().currentCategoryTabId,
            selectedFilterModel: context.read<SelectedFilterCubit>().state,
          );
          pop(context);
        },
        backgroundColor: Colour.greenishBlue,
        radius: 6,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        width: 200,
        child: const SubHeading2(
          'Apply',
          fontWeight: FontWeight.w500,
          color: Colour.white,
        ),
      ),
      body: Row(
        children: <Widget>[
          _CategoryTitles(
            onTileTap: onTileTap,
            selectedIndex: _selectedIndex,
          ),
          const VerticalDivider(thickness: 1, width: 1),
          if (_selectedIndex == 0) const _SortFilterOptions(),
          // if (_selectedIndex == 1) const _CategoryFilterOption(),
          if (_selectedIndex == 2) const _BrandsFilterOptions(),
          if (_selectedIndex == 3) const _PriceCategoryOptions()
        ],
      ),
    );
  }
}

class _CategoryTitles extends StatelessWidget {
  const _CategoryTitles({
    Key? key,
    required this.onTileTap,
    required this.selectedIndex,
  }) : super(key: key);
  final Function(int index) onTileTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colour.offWhite,
        child: Column(
          children: <Widget>[
            ...ListTile.divideTiles(
              context: context,
              tiles: <Widget>[
                CustomListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                  onTap: () {
                    onTileTap(0);
                  },
                  backgroundColor:
                      selectedIndex == 0 ? Colour.white : Colour.transparent,
                  title: SubHeading2(
                    'Sort',
                    fontWeight: selectedIndex == 0
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                // CustomListTile(
                //   contentPadding:
                //       const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                //   onTap: () {
                //     onTileTap(1);
                //   },
                //   backgroundColor:
                //       selectedIndex == 1 ? Colour.white : Colour.transparent,
                //   title: SubHeading2(
                //     'Category',
                //     fontWeight: selectedIndex == 1
                //         ? FontWeight.bold
                //         : FontWeight.normal,
                //   ),
                // ),
                CustomListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                  onTap: () {
                    onTileTap(2);
                  },
                  backgroundColor:
                      selectedIndex == 2 ? Colour.white : Colour.transparent,
                  title: SubHeading2(
                    'Brand',
                    fontWeight: selectedIndex == 2
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                CustomListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
                  onTap: () {
                    onTileTap(3);
                  },
                  backgroundColor:
                      selectedIndex == 3 ? Colour.white : Colour.transparent,
                  title: SubHeading2(
                    'Price Range',
                    fontWeight: selectedIndex == 3
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandsFilterOptions extends StatelessWidget {
  const _BrandsFilterOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocBuilder<SelectedFilterCubit, SelectedFilterModel>(
        builder: (BuildContext context, SelectedFilterModel filterState) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubHeading2(
                  'Show By Brands',
                  size: 14,
                  fontWeight: FontWeight.bold,
                  color: Colour.lightGrey,
                ),
                sizedBoxHeight(20),
                Expanded(
                  child: BlocBuilder<BrandsCubit, BrandsState>(
                    builder: (BuildContext context, BrandsState state) {
                      if (state is BrandsLoading) {
                        return const Center(child: LoadingIndicator());
                      } else if (state is BrandsSuccess) {
                        return ListView.builder(
                          itemCount: state.brandsModel.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: CustomListTile(
                                onTap: () {
                                  Set<int> _set = <int>{};
                                  _set.addAll(filterState.brandSet);
                                  if (_set.contains(
                                      state.brandsModel.data[index].id)) {
                                    _set.remove(
                                        state.brandsModel.data[index].id);
                                  } else {
                                    _set.add(state.brandsModel.data[index].id);
                                  }
                                  context
                                      .read<SelectedFilterCubit>()
                                      .updateBrandSet(_set);
                                },
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      state.brandsModel.data[index].logo),
                                ),
                                title: SubHeading2(
                                  state.brandsModel.data[index].name,
                                  fontWeight: FontWeight.w500,
                                  color: filterState.brandSet.contains(
                                          state.brandsModel.data[index].id)
                                      ? Colour.black
                                      : Colour.lightGrey.withOpacity(0.8),
                                ),
                                trailing: filterState.brandSet.contains(
                                        state.brandsModel.data[index].id)
                                    ? const Icon(
                                        Icons.check,
                                        color: Colour.green,
                                      )
                                    : Container(),
                              ),
                            );
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          );
        },
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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocBuilder<SelectedFilterCubit, SelectedFilterModel>(
        builder: (BuildContext context, SelectedFilterModel state) {
          return Padding(
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
                  '${Constants.rupee}${state.priceRange.start.ceil()} - ${Constants.rupee}${state.priceRange.end.ceil()}',
                  size: 16,
                  fontWeight: FontWeight.bold,
                  color: Colour.black,
                ),
                sizedBoxHeight(10),
                RangeSlider(
                  inactiveColor: Colour.lightGrey.withOpacity(0.5),
                  activeColor: Colour.greenishBlue,
                  values: state.priceRange,
                  min: 50,
                  max: 10000,
                  divisions: 10000,
                  labels: RangeLabels(
                    state.priceRange.start.round().toString(),
                    state.priceRange.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    context
                        .read<SelectedFilterCubit>()
                        .updateRange(values.start, values.end);
                  },
                )
              ],
            ),
          );
        },
      ),
    );
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
      child: BlocBuilder<SelectedFilterCubit, SelectedFilterModel>(
        builder: (BuildContext context, SelectedFilterModel state) {
          return Padding(
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
                  onTap: () {
                    context
                        .read<SelectedFilterCubit>()
                        .updateSortBy(SortByEnum.new_arrival);
                  },
                  leading: CustomImageWidget(
                    image: state.sortBy == SortByEnum.new_arrival
                        ? Assets.radio
                        : Assets.unradio,
                    scale: 2,
                  ),
                  title: SubHeading2(
                    "What's New",
                    color: state.sortBy == SortByEnum.new_arrival
                        ? Colour.black
                        : Colour.lightGrey.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                sizedBoxHeight(20),
                CustomListTile(
                  onTap: () {
                    context
                        .read<SelectedFilterCubit>()
                        .updateSortBy(SortByEnum.price_low_to_high);
                  },
                  leading: CustomImageWidget(
                    image: state.sortBy == SortByEnum.price_low_to_high
                        ? Assets.radio
                        : Assets.unradio,
                    scale: 2,
                  ),
                  title: SubHeading2(
                    'Price - Low to High',
                    color: state.sortBy == SortByEnum.price_low_to_high
                        ? Colour.black
                        : Colour.lightGrey.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                sizedBoxHeight(20),
                CustomListTile(
                  onTap: () {
                    context
                        .read<SelectedFilterCubit>()
                        .updateSortBy(SortByEnum.price_high_to_low);
                  },
                  leading: CustomImageWidget(
                    image: state.sortBy == SortByEnum.price_high_to_low
                        ? Assets.radio
                        : Assets.unradio,
                    scale: 2,
                  ),
                  title: SubHeading2(
                    'Price - High to Low',
                    color: state.sortBy == SortByEnum.price_high_to_low
                        ? Colour.black
                        : Colour.lightGrey.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                sizedBoxHeight(20),
                CustomListTile(
                  onTap: () {
                    context
                        .read<SelectedFilterCubit>()
                        .updateSortBy(SortByEnum.top_rated);
                  },
                  leading: CustomImageWidget(
                    image: state.sortBy == SortByEnum.top_rated
                        ? Assets.radio
                        : Assets.unradio,
                    scale: 2,
                  ),
                  title: SubHeading2(
                    'Top Rated',
                    color: state.sortBy == SortByEnum.top_rated
                        ? Colour.black
                        : Colour.lightGrey.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                sizedBoxHeight(20),
                CustomListTile(
                  onTap: () {
                    context
                        .read<SelectedFilterCubit>()
                        .updateSortBy(SortByEnum.popularity);
                  },
                  leading: CustomImageWidget(
                    image: state.sortBy == SortByEnum.popularity
                        ? Assets.radio
                        : Assets.unradio,
                    scale: 2,
                  ),
                  title: SubHeading2(
                    'Popularity',
                    color: state.sortBy == SortByEnum.popularity
                        ? Colour.black
                        : Colour.lightGrey.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
