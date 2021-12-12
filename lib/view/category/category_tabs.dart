import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/category/sub_category_cubit.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/widgets/app_bar.dart';
import '../../utils/widgets/custom_image_widget.dart';
import '../../utils/widgets/product_card.dart';

class CategoryTabs extends StatefulWidget {
  const CategoryTabs({
    Key? key,
    required this.categoryName,
    required this.categoryId,
  }) : super(key: key);
  final String categoryName;
  final int categoryId;

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SubCategoryCubit>(context).getSubCategory(
      widget.categoryId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubCategoryCubit, SubCategoryState>(
      builder: (BuildContext context, SubCategoryState state) {
        if (state is SubCategoryLoaded) {
          return DefaultTabController(
            length: state.subCategoryModel.data?.length ?? 0,
            child: Scaffold(
              appBar: appBar(
                context,
                title: widget.categoryName,
                actions: <Widget>[
                  IconButton(
                    onPressed: () {
                      // push(context, const Search());
                    },
                    color: Colour.white,
                    icon: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: CustomImageWidget(
                        image: Assets.search1,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // push(context, const Filter());
                    },
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
                children: <Widget>[
                  _Tabs(
                    state: state,
                  ),
                  const _TabView(),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class _TabView extends StatefulWidget {
  const _TabView({
    Key? key,
  }) : super(key: key);

  @override
  State<_TabView> createState() => _TabViewState();
}

class _TabViewState extends State<_TabView> {
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
              childAspectRatio: 0.48,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return const ProductCard(
                productName: 'Kingfisher Premium Beer - 300 ml',
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({
    Key? key,
    required this.state,
  }) : super(key: key);
  final SubCategoryLoaded state;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: TabBar(
        isScrollable: true,
        indicatorColor: Colour.greenishBlue,
        indicatorWeight: 3,
        labelPadding: const EdgeInsets.symmetric(horizontal: 20),
        labelColor: Colour.greenishBlue,
        unselectedLabelColor: Colour.black,
        tabs: <Widget>[
          ...List<Tab>.generate(
            state.subCategoryModel.data?.length ?? 0,
            (int index) => Tab(
              text: state.subCategoryModel.data?[index].name ?? '',
            ),
          )
        ],
      ),
    );
  }
}
