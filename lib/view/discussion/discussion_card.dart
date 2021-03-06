part of 'discussion.dart';

class _DiscussionCard extends StatelessWidget {
  _DiscussionCard({
    Key? key,
    this.showComments = true,
    required this.blog,
  }) : super(key: key);

  final bool showComments;
  final Datum blog;
  final ValueNotifier<bool> isLiked = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      child: Column(
        children: <Widget>[
          ElevatedContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                sizedBoxHeight(16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomListTile(
                    leading: Image.asset(
                      Assets.profile,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: SubHeading1(blog.title ?? ''),
                    subtitle: SubHeading2(
                      DateFormat('dd/MM/yyyy')
                          .format(DateTime.parse(blog.createdAt)),
                      size: 14,
                      color: Colour.subtitleColor,
                    ),
                  ),
                ),
                const Divider(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SubHeading2(
                    blog.description ?? '',
                    size: 15,
                  ),
                ),
                if (blog.image != null) sizedBoxHeight(12),
                if (blog.image != null)
                  Image.network(
                    blog.image!,
                    height: screenHeight(context) * 0.26,
                    width: screenWidth(context),
                    fit: BoxFit.cover,
                    errorBuilder: (BuildContext context, Object error,
                            StackTrace? stacktrace) =>
                        Image.asset(Assets.discussion),
                  ),
                sizedBoxHeight(12),
                _IconAndText(
                  iconAsset: Assets.likeFill,
                  text: blog.totalLike.toString(),
                ),
                const Divider(height: 24),
                Row(
                  children: <Widget>[
                    ValueListenableBuilder<bool>(
                      valueListenable: isLiked,
                      builder:
                          (BuildContext context, bool value, Widget? child) {
                        final bool liked = blog.isLiked == 1 || value;
                        return InkWell(
                          onTap: () {
                            if (!liked) {
                              isLiked.value = true;
                              context.read<BlogCubit>().like(blog.id);
                            }
                          },
                          child: _IconAndText(
                            iconAsset: liked ? Assets.likeFill : Assets.like,
                            text: 'Like',
                            textColor: liked ? Colour.greenishBlue : null,
                            fontSize: 14,
                            iconScale: liked ? null : 2,
                          ),
                        );
                      },
                    ),
                    sizedBoxWidth(16),
                    if (showComments)
                      GestureDetector(
                        onTap: () => pushNamed(
                          context,
                          Routes.discussionDetails,
                          arguments: blog,
                        ),
                        child: const _IconAndText(
                          iconAsset: Assets.comment,
                          text: 'Comment',
                          fontSize: 14,
                          iconScale: 2,
                        ),
                      ),
                  ],
                ),
                sizedBoxHeight(16),
              ],
            ),
          )
        ],
      ),
    );
  }
}
