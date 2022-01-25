part of 'my_orders.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({
    Key? key,
    required this.orderId,
  }) : super(key: key);
  final int orderId;

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrderDetailCubit>(context).getOrderDetail(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.white,
      appBar: appBar(
        context,
        title: 'Order Details',
      ),
      body: BlocBuilder<OrderDetailCubit, OrderDetailState>(
        builder: (BuildContext context, OrderDetailState state) {
          if (state is OrderDetailInitial) {
            return const LoadingIndicator();
          } else if (state is OrderDetailLoaded) {
            return _OrderDetailColumn(
              state: state,
            );
          } else {
            return Center(
              child: SubHeading2(
                (state as OrderDetailFailure).failure.message,
              ),
            );
          }
        },
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: 16.0,
      //     vertical: 16,
      //   ),
      //   child: CustomButton(
      //     radius: 25,
      //     backgroundColor: Colour.greenishBlue,
      //     padding: const EdgeInsets.symmetric(vertical: 15),
      //     onTap: () {
      //       showDialog(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return ConfirmationDialog(
      //               onConfirm: () {
      //                 pop(context);
      //                 pop(context);
      //               },
      //               title: 'Are you sure ?',
      //               subtitle: 'Please Confirm Before Cancelling Your Order',
      //             );
      //           });
      //     },
      //     child: const SubHeading2(
      //       'CANCEL ORDER',
      //       color: Colour.white,
      //       size: 18,
      //     ),
      //   ),
      // ),
    );
  }
}

class _OrderDetailColumn extends StatelessWidget {
  const _OrderDetailColumn({
    Key? key,
    required this.state,
  }) : super(key: key);
  final OrderDetailLoaded state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // sizedBoxHeight(16),
        // const Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 12),
        //   child: _OrderDetailAddressTile(
        //     name: 'Kynd Shop',
        //     address: '',
        //     asset: Assets.redLocationPin,
        //   ),
        // ),
        sizedBoxHeight(16),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _OrderDetailAddressTile(
              name: 'Home',
              address: state.orderDetailModel.data!.isNotEmpty
                  ? '${state.orderDetailModel.data?[0].shippingAddress?.address} ${state.orderDetailModel.data![0].shippingAddress!.city}'
                  : '',
              asset: Assets.greenLocationPin,
            )),
        sizedBoxHeight(16),
        Container(
          height: 40,
          width: screenWidth(context),
          color: Colour.offWhite,
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: const SubHeading2(
            'Bill Details',
            size: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        sizedBoxHeight(16),
        ListView.separated(
          itemCount: state.orderDetailModel.data?.length ?? 0,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (BuildContext context, int index) =>
              sizedBoxHeight(10),
          itemBuilder: (BuildContext context, int index) {
            return _BillDetailItem(
              item:
                  '${state.orderDetailModel.data?[index].productName} x ${state.orderDetailModel.data?[index].quantity}',
              amount: '${state.orderDetailModel.data?[index].price}',
            );
          },
        ),
        const Divider(
          height: 32,
          indent: 22,
          endIndent: 22,
        ),
        _BillDetailItem(
          item: 'Order Price',
          amount: '${Constants.rupee}${state.orderDetailModel.grand_total}',
        ),
        sizedBoxHeight(10),
        _BillDetailItem(
          item: 'Discount',
          amount: state.orderDetailModel.data!.isNotEmpty
              ? '${state.orderDetailModel.data?[0].couponDiscount.toString()}'
              : '',
          amountColor: Colour.subtitleColor,
        ),
        // sizedBoxHeight(10),
        // const _BillDetailItem(
        //   item: 'Taxes and Charges',
        //   amount: '₹100',
        // ),
        sizedBoxHeight(10),
        _BillDetailItem(
          item: 'Delivery Fee',
          amount: state.orderDetailModel.data!.isNotEmpty
              ? '${state.orderDetailModel.data?[0].shippingCost.toString()}'
              : '',
        ),
        sizedBoxHeight(10),
        _BillDetailItem(
          item: 'Total',
          itemColor: Colour.greenishBlue,
          itemTextSize: 20,
          itemTextWeight: FontWeight.w500,
          amount: '${Constants.rupee}${state.orderDetailModel.grand_total}',
          amountTextSize: 20,
          amountColor: Colour.greenishBlue,
        ),
      ],
    );
  }

  // double calculateTotal(List<Datum> datum) {
  //   double sum = 0;
  //   for (var data in datum) {
  //     sum += (double.tryParse(data.price ?? '0') ?? 0);
  //   }
  //   return sum;
  // }
}

class _BillDetailItem extends StatelessWidget {
  const _BillDetailItem({
    Key? key,
    required this.item,
    required this.amount,
    this.amountColor,
    this.itemColor,
    this.amountTextSize,
    this.itemTextSize,
    this.itemTextWeight,
  }) : super(key: key);

  final String item;
  final String amount;
  final Color? amountColor;
  final Color? itemColor;
  final double? amountTextSize;
  final double? itemTextSize;
  final FontWeight? itemTextWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        children: <Widget>[
          SubHeading2(
            item,
            size: itemTextSize ?? 14,
            color: itemColor ?? Colour.subtitleColor,
            fontWeight: itemTextWeight,
          ),
          const Spacer(),
          SubHeading2(
            amount,
            fontWeight: FontWeight.w600,
            size: amountTextSize,
            color: amountColor,
          ),
        ],
      ),
    );
  }
}

class _OrderDetailAddressTile extends StatelessWidget {
  const _OrderDetailAddressTile({
    Key? key,
    required this.name,
    required this.asset,
    required this.address,
  }) : super(key: key);

  final String name;
  final String asset;
  final String address;

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: SubHeading2(
        name,
        fontWeight: FontWeight.bold,
      ),
      spaceBetweenTitleAndSubtitle: 8,
      subtitle: SizedBox(
        child: Row(
          children: <Widget>[
            CustomImageWidget(
              image: asset,
              scale: 1.8,
            ),
            sizedBoxWidth(8),
            SizedBox(
              width: screenWidth(context) * 0.8,
              child: SubHeading2(
                address,
                size: 12,
                color: Colour.subtitleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
