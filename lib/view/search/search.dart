import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

import '../../logic/product/search_product_cubit.dart';
import '../../utils/export_utilities.dart';
import '../../utils/widgets/custom_image_widget.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: '', elevation: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const _SearchField(),

          Expanded(
            child: BlocBuilder<SearchProductCubit, SearchProductState>(
              builder: (BuildContext context, SearchProductState state) {
                if (state is SearchProductInitial) {
                  return Column(
                    children: const <Widget>[
                      CustomImageWidget(
                        image: Assets.notSearch,
                        scale: 2.5,
                      ),
                    ],
                  );
                }
                if (state is SearchProductLoaded &&
                    state.searchProductModel.data!.isEmpty) {
                  return Column(
                    children: const <Widget>[
                      SubHeading1(
                        'No result found',
                        color: Colour.lightGrey,
                      ),
                    ],
                  );
                }
                if (state is SearchProductLoaded) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.searchProductModel.data?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        child: ProductCard(
                          productName:
                              state.searchProductModel.data?[index].name,
                          productImage: state
                              .searchProductModel.data?[index].thumbnailImg,
                          productId: state.searchProductModel.data?[index].id,
                          basePrice:
                              state.searchProductModel.data?[index].basePrice,
                          baseDiscountedPrice: state.searchProductModel
                              .data?[index].baseDiscountedPrice,
                        ),
                      );
                    },
                  );
                }

                if (state is SearchProductFailure) {
                  return Column(
                    children: <Widget>[
                      SubHeading1(
                        state.failure.message,
                        color: Colour.lightGrey,
                      ),
                    ],
                  );
                }
                return Container();
              },
            ),
          ),
          // Spacer(),
          // ProductListBlock(title: 'Recommended')
        ],
      ),
    );
  }
}

class _SearchField extends StatefulWidget {
  const _SearchField({
    Key? key,
  }) : super(key: key);

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  void onChange(String? onChangeText) {
    if (onChangeText != null && onChangeText.length >= 3) {
      context.read<SearchProductCubit>().searchProduct(onChangeText);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    return Container(
      color: Colour.darkBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
        child: CustomTextField(
          controller: _textEditingController,
          onChanged: (String? onChangeText) {
            onChange(onChangeText);
          },
          autofocus: true,
          filled: true,
          fillColor: Colour.white,
          borderColor: Colour.transparent,
          borderRadius: 100,
          errorBorderRadius: 50,
          enabledBorderRadius: 50,
          focusBorderRadius: 50,
          disabledBorderRadius: 50,
          enabledBorderColor: Colour.transparent,
          disabledBorderColor: Colour.transparent,
          hintText: 'Search your drink here...',
          hintStyle: const TextStyle(
            color: Colour.black,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.all(14.0),
            child: CustomImageWidget(
              image: Assets.search,
              scale: 5,
              color: Colour.black,
            ),
          ),
          suffixIcon: InkWell(
            onTap: () {
              _textEditingController.clear();
            },
            child: const Padding(
              padding: EdgeInsets.all(14.0),
              child: CustomImageWidget(
                image: Assets.close,
                scale: 5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
