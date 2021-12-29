part of 'discussion.dart';

class _UploadDiscussionImage extends StatelessWidget {
  const _UploadDiscussionImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImagePickingCubit, ImagePickingState>(
      listener: (BuildContext context, ImagePickingState state) {
        if (state is ImageError) {
          showToast('Could not pick image');
        }
      },
      builder: (BuildContext context, ImagePickingState state) {
        if (state is ImagePickingInitial || state is ImageError) {
          return const _PickImageWidget();
        } else if (state is ImagePicked) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              Image.file(
                File(state.file.path),
                height: screenHeight(context) * 0.26,
                width: screenWidth(context),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () =>
                      context.read<ImagePickingCubit>().pickFromGallery(),
                  backgroundColor: Colour.greenishBlue,
                  child: const Icon(
                    CupertinoIcons.cloud_upload,
                    color: Colour.white,
                  ),
                ),
              )
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class _PickImageWidget extends StatelessWidget {
  const _PickImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DottedBorder(
          borderType: BorderType.RRect,
          color: Colour.greenishBlue,
          radius: const Radius.circular(12),
          dashPattern: const <double>[6],
          child: RoundContainer(
            width: screenWidth(context) * 0.4,
            onTap: () => context.read<ImagePickingCubit>().pickFromGallery(),
            alignment: Alignment.center,
            height: 130,
            color: Colour.greenishBlue.withOpacity(0.08),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Icon(
                  CupertinoIcons.cloud_upload,
                  size: 50,
                  color: Colour.greenishBlue,
                ),
                SubHeading2(
                  'Upload',
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
