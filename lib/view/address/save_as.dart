part of 'my_address.dart';

enum SaveAs {
  home,
  work,
  others,
}

class _SaveAsWidget extends StatefulWidget {
  const _SaveAsWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  State<_SaveAsWidget> createState() => _SaveAsWidgetState();
}

class _SaveAsWidgetState extends State<_SaveAsWidget> {
  final ValueNotifier<SaveAs> _saveAs = ValueNotifier<SaveAs>(SaveAs.home);

  @override
  void initState() {
    super.initState();
    widget.controller.text = _saveAs.value.toString();
  }

  void changeSaveAs(SaveAs value) {
    _saveAs.value = value;
    widget.controller.text = value.toString().split('.').last;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<SaveAs>(
      valueListenable: _saveAs,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return Row(
          children: <Widget>[
            _SaveAsChip(
              onTap: () => changeSaveAs(SaveAs.home),
              label: 'HOME',
              isSelected: value == SaveAs.home,
            ),
            sizedBoxWidth(10),
            _SaveAsChip(
              onTap: () => changeSaveAs(SaveAs.work),
              label: 'WORK',
              isSelected: value == SaveAs.work,
            ),
            sizedBoxWidth(10),
            _SaveAsChip(
              onTap: () => changeSaveAs(SaveAs.others),
              label: 'OTHER',
              isSelected: value == SaveAs.others,
            ),
          ],
        );
      },
    );
  }
}

class _SaveAsChip extends StatelessWidget {
  const _SaveAsChip({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        visualDensity: VisualDensity.compact,
        backgroundColor: isSelected ? Colour.greenishBlue : Colour.white,
        side: const BorderSide(color: Colour.greenishBlue),
        label: SubHeading1(
          label,
          size: 12,
          color: isSelected ? Colour.white : Colour.greenishBlue,
        ),
      ),
    );
  }
}
