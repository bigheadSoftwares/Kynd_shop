import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/export_utilities.dart';

part 'order_detail.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: 'My Orders',
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: 5,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (BuildContext context, int index) =>
            sizedBoxHeight(18),
        itemBuilder: (BuildContext context, int index) {
          return const _OrderCard();
        },
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => pushNamed(context, Routes.orderDetail),
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
                title: const SubHeading2(
                  'Beer Shop',
                  fontWeight: FontWeight.w500,
                  size: 14,
                ),
                subtitle: const SubHeading2(
                  'New Delhi, Delhi',
                  size: 12,
                  color: Colour.subtitleColor,
                ),
                trailingTop: const Chip(
                  padding: EdgeInsets.zero,
                  labelPadding: EdgeInsets.symmetric(horizontal: 15),
                  visualDensity: VisualDensity(vertical: -4),
                  label: SubHeading2(
                    'Upcoming',
                    size: 10,
                    color: Colour.white,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colour.upcomingColor,
                ),
              ),
            ),
            const Divider(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: CustomListTile(
                title: SubHeading2(
                  'ITEMS',
                  size: 12,
                  color: Colour.subtitleColor,
                  fontWeight: FontWeight.w500,
                ),
                spaceBetweenTitleAndSubtitle: 2,
                subtitle: SubHeading2(
                  '6 x Kingfisher beer chilled',
                  fontWeight: FontWeight.w500,
                  size: 14,
                ),
              ),
            ),
            sizedBoxHeight(10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: CustomListTile(
                title: SubHeading2(
                  'ORDERED ON',
                  color: Colour.subtitleColor,
                  size: 12,
                  fontWeight: FontWeight.w500,
                ),
                spaceBetweenTitleAndSubtitle: 2,
                subtitle: SubHeading2(
                  '10 Nov, 2021 at 09:10 PM',
                  fontWeight: FontWeight.w500,
                  size: 14,
                ),
              ),
            ),
            const Divider(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.0),
              child: Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Total: ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: '₹ 2500.00/-',
                      style: TextStyle(
                        fontSize: 15,
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
