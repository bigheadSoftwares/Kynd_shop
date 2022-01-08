part of 'discussion.dart';

class DiscussionDetails extends StatefulWidget {
  const DiscussionDetails({Key? key, required this.blog}) : super(key: key);

  final Datum blog;

  @override
  State<DiscussionDetails> createState() => _DiscussionDetailsState();
}

class _DiscussionDetailsState extends State<DiscussionDetails> {
  @override
  void initState() {
    super.initState();
    context.read<BlogCommentsCubit>().getComments(widget.blog.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.offWhite,
      appBar: appBar(
        context,
        title: 'Comments',
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          ListView(
            padding: const EdgeInsets.fromLTRB(0, 0, 16, 80),
            children: <Widget>[
              _DiscussionCard(
                showComments: false,
                blog: widget.blog,
              ),
              sizedBoxHeight(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Heading2(
                  context.watch<BlogCommentsCubit>().state
                          is BlogCommentsSuccess
                      ? '${(context.read<BlogCommentsCubit>().state as BlogCommentsSuccess).comments.data.length} Comments'
                      : '0 Comments',
                  size: 18,
                ),
              ),
              const _Comments(),
            ],
          ),
          _AddComment(
            blogId: widget.blog.id,
          )
        ],
      ),
    );
  }
}

class _Comments extends StatelessWidget {
  const _Comments({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogCommentsCubit, BlogCommentsState>(
      builder: (BuildContext context, BlogCommentsState state) {
        if (state is BlogCommentsError) {
          return SubHeading2(state.error.serverMessage ?? state.error.message);
        } else if (state is BlogCommentsSuccess) {
          return ListView.separated(
            shrinkWrap: true,
            itemCount: state.comments.data.length,
            reverse: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            separatorBuilder: (BuildContext context, int index) =>
                sizedBoxHeight(20),
            itemBuilder: (BuildContext context, int index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const CircleAvatar(
                    backgroundColor: Colour.white,
                    radius: 24,
                    backgroundImage: AssetImage(Assets.profile),
                  ),
                  sizedBoxWidth(10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          color: Colour.greyishBlue,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          )),
                      child: CustomListTile(
                        title: SubHeading1(
                          state.comments.data[index].userName,
                          size: 16,
                        ),
                        subtitle: SubHeading2(
                          state.comments.data[index].comment,
                          size: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return const LoadingIndicator();
        }
      },
    );
  }
}

class _AddComment extends StatefulWidget {
  const _AddComment({
    Key? key,
    required this.blogId,
  }) : super(key: key);

  final int blogId;

  @override
  State<_AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<_AddComment> {
  final TextEditingController _comment = TextEditingController();

  @override
  void dispose() {
    _comment.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colour.white,
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              controller: _comment,
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                isDense: true,
                hintText: 'Say Something...',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Colour.subtitleColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(
                    color: Colour.greenishBlue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: const BorderSide(
                    color: Colour.greenishBlue,
                  ),
                ),
              ),
            ),
          ),
          BlocConsumer<AddBlogCommentCubit, AddBlogCommentState>(
            listener: (BuildContext context, AddBlogCommentState state) {
              if (state is AddBlogCommentFailure) {
                showSnackBar(
                  context: context,
                  msg: state.error.serverMessage ?? state.error.message,
                );
              } else if (state is AddBlogCommentSuccess) {
                context.read<BlogCommentsCubit>().getComments(widget.blogId);
              }
            },
            builder: (BuildContext context, AddBlogCommentState state) {
              if (state is AddBlogCommentLoading) {
                return const LoadingIndicator(
                  height: 20,
                  width: 20,
                );
              } else {
                return IconButton(
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    context.read<AddBlogCommentCubit>().addComment(
                          blogId: widget.blogId,
                          comment: _comment.text,
                        );
                    _comment.clear();
                  },
                  icon: Image.asset(
                    Assets.send,
                    scale: 2,
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
