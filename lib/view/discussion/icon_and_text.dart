part of 'discussion.dart';

class _IconAndText extends StatelessWidget {
  const _IconAndText({
    Key? key,
    required this.iconAsset,
    required this.text,
    this.fontSize,
    this.iconScale,
    this.iconColor,
    this.textColor,
  }) : super(key: key);

  final String iconAsset;
  final double? iconScale;
  final String text;
  final double? fontSize;
  final Color? iconColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          CustomImageWidget(
            image: iconAsset,
            scale: iconScale ?? 1.5,
            color: iconColor,
          ),
          sizedBoxWidth(8),
          SubHeading2(
            text,
            size: fontSize ?? 12,
            color: textColor ?? Colour.subtitleColor,
          )
        ],
      ),
    );
  }
}
