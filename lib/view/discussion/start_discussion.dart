part of 'discussion.dart';

class StartDiscussion extends StatefulWidget {
  const StartDiscussion({Key? key}) : super(key: key);

  @override
  State<StartDiscussion> createState() => _StartDiscussionState();
}

class _StartDiscussionState extends State<StartDiscussion> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _tag = TextEditingController();
  final TextEditingController _description = TextEditingController();

  String? chosenValue;

  @override
  void dispose() {
    _title.dispose();
    _tag.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImagePickingCubit>(
      create: (BuildContext context) => ImagePickingCubit(),
      child: Scaffold(
        appBar: appBar(
          context,
          title: 'Post',
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(16.0, 20, 16, 100),
          children: <Widget>[
            const SubHeading2(
              'Title',
              fontWeight: FontWeight.w500,
            ),
            sizedBoxHeight(8),
            CustomTextField(
              controller: _title,
              borderRadius: 10,
              filled: true,
              cursorColor: Colour.greenishBlue,
              focusBorderColor: Colour.greenishBlue,
              fillColor: Colour.offWhite,
              hintText: 'Enter any title you desire',
            ),
            sizedBoxHeight(16),
            const SubHeading2(
              'Tag',
              fontWeight: FontWeight.w500,
            ),
            sizedBoxHeight(8),
            CustomDropdown(
              chosenValue: chosenValue,
              items: const <String>[
                'Kisgfisher',
                'Budwiser',
                'Tuborg',
                'Royal Stag',
                'Signature',
                'Officers Blue',
                '1001 pipers',
                'Whisky'
              ],
              onChanged: (String? value) {
                if (value != null) {
                  setState(() {
                    chosenValue = value;
                  });
                  _tag.text = value;
                }
              },
            ),
            sizedBoxHeight(16),
            const SubHeading2(
              'Write Description',
              fontWeight: FontWeight.w500,
            ),
            sizedBoxHeight(8),
            CustomTextField(
              controller: _description,
              borderRadius: 10,
              filled: true,
              minLines: 4,
              maxLines: 10,
              cursorColor: Colour.greenishBlue,
              focusBorderColor: Colour.greenishBlue,
              fillColor: Colour.offWhite,
              hintText: 'Enter some description for',
            ),
            sizedBoxHeight(16),
            const SubHeading2(
              'Upload Image',
              fontWeight: FontWeight.w500,
            ),
            sizedBoxHeight(8),
            const _UploadDiscussionImage()
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomButton(
          radius: 25,
          width: screenWidth(context) * 0.9,
          backgroundColor: Colour.greenishBlue,
          padding: const EdgeInsets.symmetric(vertical: 15),
          onTap: () {
            pop(context);
          },
          child: const SubHeading2(
            'SAVE',
            color: Colour.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}
