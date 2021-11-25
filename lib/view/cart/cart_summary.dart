part of 'cart.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    Key? key,
    required this.title,
    required this.amount,
    this.isBold = false,
  }) : super(key: key);
  final String title;
  final double amount;
  final bool? isBold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SubHeading2(
            title,
            size: 12,
            fontWeight: isBold! ? FontWeight.bold : FontWeight.w500,
          ),
          SubHeading2(
            '${Constants.rupee}$amount',
            size: 12,
            fontWeight: isBold! ? FontWeight.bold : FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
