part of 'refer_and_earn.dart';

class _ShareWithFriends extends StatelessWidget {
  const _ShareWithFriends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SubHeading1(
          'Share with your friends',
          fontWeight: FontWeight.w500,
        ),
        sizedBoxHeight(screenHeight(context) * 0.02),
        TextButton.icon(
          onPressed: () {},
          icon: const CustomImageWidget(
            image: Assets.whatsApp,
            height: 20,
            width: 20,
          ),
          label: const SubHeading1('Whatsapp'),
        ),
        sizedBoxHeight(screenHeight(context) * 0.02),
        TextButton.icon(
          onPressed: () {},
          icon: const CustomImageWidget(
            image: Assets.facebook,
            height: 20,
            width: 20,
          ),
          label: const SubHeading1('Facebook'),
        ),
        sizedBoxHeight(screenHeight(context) * 0.02),
        TextButton.icon(
          onPressed: () {},
          icon: const CustomImageWidget(
            image: Assets.twitter,
            height: 20,
            width: 20,
          ),
          label: const SubHeading1('Twitter'),
        ),
        sizedBoxHeight(screenHeight(context) * 0.02),
        TextButton.icon(
          onPressed: () {},
          icon: const CustomImageWidget(
            image: Assets.shareViaEmail,
            height: 20,
            width: 20,
          ),
          label: const SubHeading1('Email'),
        ),
      ],
    );
  }
}
