part of 'feedback.dart';

class _Emojis extends StatelessWidget {
  _Emojis(
      {Key? key,
      required this.selectedSmiley,
      required this.changeSelectedSmiley})
      : super(key: key);

  final ValueNotifier<int> selectedSmiley;
  final Function(int) changeSelectedSmiley;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: selectedSmiley,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return Row(
          children: <Widget>[
            GestureDetector(
              onTap: () => changeSelectedSmiley(1),
              child: CustomImageWidget(
                image: value == 1 ? Assets.colouredSmile1 : Assets.smile1,
                height: 80,
                width: 80,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => changeSelectedSmiley(3),
              child: CustomImageWidget(
                image: value == 2 ? Assets.colouredSmile2 : Assets.smile2,
                height: 80,
                width: 80,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => changeSelectedSmiley(5),
              child: CustomImageWidget(
                image: value == 3 ? Assets.colouredSmile3 : Assets.smile3,
                height: 80,
                width: 80,
              ),
            ),
            const Spacer(),
          ],
        );
      },
    );
  }
}
