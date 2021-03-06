import 'dart:convert';

import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kynd_shop/data/order/order_detail_model/datum.dart';
import 'package:kynd_shop/logic/order/order_detail_cubit.dart';

import '../../logic/order/order_list_cubit.dart';
import '../../utils/export_utilities.dart';

part 'order_detail.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<OrderListCubit>(context).getOrderList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: 'My Orders',
      ),
      body: BlocBuilder<OrderListCubit, OrderListState>(
        builder: (BuildContext context, OrderListState state) {
          if (state is OrderListInitial) {
            return const LoadingIndicator();
          } else if (state is OrderListLoaded) {
            if ((state.orderListModel.data?.length ?? 0) == 0) {
              return const Center(child: SubHeading2("You've ordered nothing"));
            }
            return ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: state.orderListModel.data?.length ?? 0,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) =>
                  sizedBoxHeight(18),
              itemBuilder: (BuildContext context, int index) {
                return _OrderCard(
                  orderId: state.orderListModel.data?[index].id ?? 0,
                  shopName: 'Kynd Shop',
                  orderedOn: state.orderListModel.data?[index].date,
                  deliveryStatus:
                      state.orderListModel.data?[index].deliveryStatus,
                  price: state.orderListModel.data?[index].grandTotal,
                );
              },
            );
          } else {
            return Center(
                child:
                    SubHeading2((state as OrderListFailure).failure.message));
          }
        },
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({
    Key? key,
    required this.orderId,
    this.shopName,
    this.deliveryStatus,
    this.price,
    this.orderedOn,
  }) : super(key: key);
  final int orderId;
  final String? shopName;
  final String? deliveryStatus;
  final int? price;
  final String? orderedOn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushNamed(context, Routes.orderDetail, arguments: orderId),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radius(4),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 10.0,
                spreadRadius: 2.0),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            sizedBoxHeight(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: CustomListTile(
                leading: ClipRRect(
                  borderRadius: radius(4),
                  child: Image.asset(
                    Assets.bar2,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                title: SubHeading2(
                  shopName ?? '',
                  fontWeight: FontWeight.w500,
                  size: 14,
                ),
                // subtitle: SubHeading2(
                //   shopAddress ?? '',
                //   size: 14,
                //   color: Colour.subtitleColor,
                // ),
                trailingTop: Chip(
                  padding: EdgeInsets.zero,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                  visualDensity: const VisualDensity(vertical: -4),
                  label: SubHeading2(
                    deliveryStatus ?? '',
                    size: 12,
                    color: Colour.white,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colour.upcomingColor,
                ),
              ),
            ),
            const Divider(height: 20),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 12.0),
            //   child: CustomListTile(
            //     title: SubHeading2(
            //       'ITEMS',
            //       size: 12,
            //       color: Colour.subtitleColor,
            //       fontWeight: FontWeight.w500,
            //     ),
            //     spaceBetweenTitleAndSubtitle: 2,
            //     // subtitle: SubHeading2(
            //     //   '$quantity x $itemName',
            //     //   fontWeight: FontWeight.w500,
            //     //   size: 14,
            //     // ),
            //   ),
            // ),
            sizedBoxHeight(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: CustomListTile(
                title: const SubHeading2(
                  'ORDERED ON',
                  color: Colour.subtitleColor,
                  size: 12,
                  fontWeight: FontWeight.w500,
                ),
                spaceBetweenTitleAndSubtitle: 2,
                subtitle: SubHeading2(
                  orderedOn ?? '',
                  fontWeight: FontWeight.w500,
                  size: 14,
                ),
              ),
            ),
            const Divider(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: 'Total: ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '??? $price/-',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colour.greenishBlue,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
