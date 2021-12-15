import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cart/add_to_cart_cubit.dart';
import '../../utils/widgets/add_to_cart_widget.dart';
import '../../logic/product/product_detail_cubit.dart';
import '../../utils/export_utilities.dart';
import '../../utils/widgets/cut_mrp.dart';
import '../../utils/constants/colors.dart';
import '../../utils/widgets/custom_image_widget.dart';
part 'product_image.dart';
part 'details.dart';
part 'add_to_cart_section.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    Key? key,
    this.productId,
    this.isAddedToCart,
    this.cartQuantity,
    this.productPrice,
  }) : super(key: key);
  final int? productId;
  final bool? isAddedToCart;
  final int? cartQuantity;
  final int? productPrice;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductDetailCubit>(context)
        .getProductDetail(widget.productId ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.white,
      bottomNavigationBar: BlocProvider<AddToCartCubit>(
        create: (BuildContext context) => AddToCartCubit(),
        child: _BottomCartSection(
          productPrice: widget.productPrice,
          isAddedToCart: widget.isAddedToCart,
          cartQuantity: widget.cartQuantity,
          productId: widget.productId,
        ),
      ),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<ProductDetailCubit, ProductDetailState>(
        builder: (BuildContext context, ProductDetailState state) {
          if (state is ProductDetailInitial) {
            return const LoadingIndicator();
          } else if (state is ProductDetailLoaded) {
            return SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  SizedBox(
                    height: screenHeight(context),
                  ),
                  _ProductImage(
                    imageUrl:
                        state.productDetailModel.data?[0].thumbnailImage ?? '',
                  ),
                  _ProductDetail(
                    productName: state.productDetailModel.data?[0].name ?? '',
                    basePrice:
                        (state.productDetailModel.data?[0].priceLower ?? 0) +
                            (state.productDetailModel.data?[0].discount ?? 0),
                    description:
                        state.productDetailModel.data?[0].description ??
                            'No description available.',
                    discountedPrice:
                        state.productDetailModel.data?[0].priceLower ?? 0,
                  ),
                  const _FavoriteIcon()
                ],
              ),
            );
          } else {
            return Center(
              child:
                  SubHeading2((state as ProductDetailFailure).failure.message),
            );
          }
        },
      ),
    );
  }
}

class _FavoriteIcon extends StatelessWidget {
  const _FavoriteIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: screenHeight(context) * 0.35,
      right: 25,
      child: Container(
        height: 50,
        width: 50,
        decoration: const BoxDecoration(
            color: Colour.greenishBlue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),
        child: const Icon(
          Icons.favorite,
          color: Colour.white,
          size: 30,
        ),
      ),
    );
  }
}
