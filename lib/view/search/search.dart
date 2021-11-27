import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/material.dart';
import '../../utils/export_utilities.dart';
import '../../utils/widgets/custom_image_widget.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, title: '', elevation: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const <Widget>[
          _SearchField(),
          CustomImageWidget(
            image: Assets.notSearch,
            scale: 2.5,
          ),
          SubHeading1(
            'No result found',
            color: Colour.lightGrey,
          ),
          Spacer(),
          ProductListBlock(title: 'Recommended')
        ],
      ),
    );
  }
}

class _SearchField extends StatefulWidget {
  const _SearchField({
    Key? key,
  }) : super(key: key);

  @override
  State<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<_SearchField> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();
    return Container(
      color: Colour.darkBlue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
        child: CustomTextField(
          controller: _textEditingController,
          filled: true,
          fillColor: Colour.white,
          borderColor: Colour.transparent,
          borderRadius: 100,
          errorBorderRadius: 50,
          enabledBorderRadius: 50,
          focusBorderRadius: 50,
          disabledBorderRadius: 50,
          enabledBorderColor: Colour.transparent,
          disabledBorderColor: Colour.transparent,
          hintText: 'Search your drink here...',
          hintStyle: const TextStyle(
            color: Colour.black,
          ),
          prefixIcon: const Padding(
            padding: EdgeInsets.all(14.0),
            child: CustomImageWidget(
              image: Assets.search,
              scale: 5,
              color: Colour.black,
            ),
          ),
          suffixIcon: const Padding(
            padding: EdgeInsets.all(14.0),
            child: CustomImageWidget(
              image: Assets.close,
              scale: 5,
            ),
          ),
        ),
      ),
    );
  }
}
