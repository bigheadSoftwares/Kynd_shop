import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/export_utilities.dart';

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
    return RoundContainer(
      vPadding: 16,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          sizedBoxHeight(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: CustomListTile(
              leading: Image.asset(
                Assets.champagne,
                height: 40,
              ),
              title: const SubHeading2('Beer Shop'),
              subtitle: const SubHeading2(
                'New Delhi, Delhi',
                size: 14,
                color: Colour.subtitleColor,
              ),
              trailingTop: const Chip(
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity(vertical: -4),
                label: SubHeading2(
                  'Upcoming',
                  size: 10,
                  color: Colour.white,
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
                size: 14,
                color: Colour.subtitleColor,
              ),
              spaceBetweenTitleAndSubtitle: 2,
              subtitle: SubHeading2('3 x Kingfisher beer chilled'),
            ),
          ),
          sizedBoxHeight(10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomListTile(
              title: SubHeading2(
                'ORDERED ON',
                color: Colour.subtitleColor,
                size: 14,
              ),
              spaceBetweenTitleAndSubtitle: 2,
              subtitle: SubHeading2('10 Nov, 2021 at 09:10 PM'),
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
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: '₹ 2700.00/-',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colour.greenishBlue,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ).outerNeumorphism();
  }
}
