import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/export_utilities.dart';
import '../../utils/widgets/cut_mrp.dart';
import '../../utils/constants/assets.dart';
import '../../utils/constants/colors.dart';
import '../../utils/widgets/custom_image_widget.dart';
part 'product_image.dart';
part 'details.dart';
part 'add_to_cart_section.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.white,
      bottomNavigationBar: const _BottomCartSection(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: screenHeight(context),
            ),
            const _ProductImage(),
            const _ProductDetail()
          ],
        ),
      ),
    );
  }
}
