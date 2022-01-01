import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:easy_coding/big_head_softwares.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../logic/blog/add_blog_comment_cubit.dart';
import '../../logic/blog/blog_comments_cubit.dart';
import '../../utils/functions/snackbar.dart';
import '../../data/blog/blog_repository.dart';
import '../../logic/blog/blog_cubit.dart';
import '../../logic/image_picking/image_picking_cubit.dart';
import '../../utils/export_utilities.dart';

part 'discussion_card.dart';
part 'icon_and_text.dart';
part 'discussion_details.dart';
part 'start_discussion.dart';
part 'upload_discussion_image.dart';

class Discussion extends StatefulWidget {
  const Discussion({Key? key}) : super(key: key);

  @override
  State<Discussion> createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
  @override
  void initState() {
    super.initState();
    context.read<BlogCubit>().getBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colour.offWhite,
      appBar: appBar(
        context,
        title: 'Discussion',
        actions: <Widget>[
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: CustomImageWidget(
              image: Assets.search1,
              color: Colour.white,
            ),
          ),
          sizedBoxWidth(8),
        ],
      ),
      body: BlocBuilder<BlogCubit, BlogState>(
        builder: (BuildContext context, BlogState state) {
          if (state is BlogLoaded) {
            return ListView.separated(
              itemCount: state.blogs.data.length,
              padding: const EdgeInsets.symmetric(vertical: 20),
              separatorBuilder: (BuildContext context, int index) =>
                  sizedBoxHeight(20),
              itemBuilder: (BuildContext context, int index) {
                return _DiscussionCard(
                  blog: state.blogs.data[index],
                );
              },
            );
          } else if (state is BlogError) {
            return const Center(child: SubHeading1('Error'));
          } else {
            return const Center(child: LoadingIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => pushNamed(
          context,
          Routes.startDiscussion,
        ),
        backgroundColor: Colour.greenishBlue,
        child: const CustomImageWidget(
          image: Assets.startDiscussion,
          scale: 1.6,
        ),
      ),
    );
  }
}
