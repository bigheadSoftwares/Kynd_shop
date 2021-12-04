part of 'feedback.dart';

class _Emojis extends StatelessWidget {
  _Emojis({Key? key}) : super(key: key);

  final ValueNotifier<int> _selectedSmiley = ValueNotifier<int>(1);

  void _changeSelectedSmiley(int index) {
    _selectedSmiley.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _selectedSmiley,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return Row(
          children: <Widget>[
            GestureDetector(
              onTap: () => _changeSelectedSmiley(1),
              child: CustomImageWidget(
                image: value == 1 ? Assets.colouredSmile1 : Assets.smile1,
                height: 80,
                width: 80,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => _changeSelectedSmiley(2),
              child: CustomImageWidget(
                image: value == 2 ? Assets.colouredSmile2 : Assets.smile2,
                height: 80,
                width: 80,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => _changeSelectedSmiley(3),
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
