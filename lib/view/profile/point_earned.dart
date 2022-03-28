part of 'profile.dart';

class PointEarned extends StatefulWidget {
  const PointEarned({Key? key}) : super(key: key);

  @override
  State<PointEarned> createState() => _PointEarnedState();
}

class _PointEarnedState extends State<PointEarned> {
  @override
  void initState() {
    super.initState();
    context.read<PointsEarnedCubit>().pointsEarned();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        title: 'Point Earned',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: BlocConsumer<PointsEarnedCubit, PointsEarnedState>(
          listener: (BuildContext context, PointsEarnedState state) {
            if (state is PointsEarnedFailure) {
              showSnackBar(context: context, msg: 'Something went wrong');
            }
          },
          builder: (BuildContext context, PointsEarnedState state) {
            if (state is PointsEarnedInitial) {
              return const Center(child: LoadingIndicator());
            } else if (state is PointsEarnedFailure) {
              return Center(
                child: SubHeading2(state.failure.message),
              );
            } else if (state is PointsEarnedLoaded) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RoundContainer(
                    color: Colour.greenishBlue,
                    vPadding: 12,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          sizedBoxHeight(16),
                          Heading1(
                            state.totalPoints.toStringAsFixed(2),
                            color: Colour.white,
                            fontWeight: FontWeight.w500,
                          ),
                          const SubHeading2(
                            'Total Points Earned',
                            size: 14,
                            fontWeight: FontWeight.w500,
                            color: Colour.white,
                          ),
                          sizedBoxHeight(16),
                        ],
                      ),
                    ),
                  ),
                  sizedBoxHeight(16),
                  const Heading2(
                    'POINT HISTORY',
                    size: 20,
                  ),
                  sizedBoxHeight(16),
                  if (state.pointsEarnedModel.data!.isEmpty)
                    const Center(child: SubHeading2('No points history')),
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.pointsEarnedModel.data?.length ?? 0,
                      physics: const BouncingScrollPhysics(),
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 24,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return CustomListTile(
                          leading: const CircleAvatar(
                            radius: 26,
                            backgroundImage: AssetImage(Assets.point),
                            backgroundColor: Colour.transparent,
                          ),
                          title: SubHeading1(
                            '${state.pointsEarnedModel.data![index].title}',
                          ),
                          subtitle: SubHeading2(
                            'On ${DateFormat('MMM dd, yyyy').format(DateTime.parse(state.pointsEarnedModel.data![index].createdAt!))}',
                            color: Colour.subtitleColor,
                            size: 14,
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Heading2(
                                '+ ${state.pointsEarnedModel.data![index].points}',
                                color: Colour.parrotGreen,
                                size: 22,
                              ),
                              SubHeading2(
                                'Order id: #${state.pointsEarnedModel.data![index].orderId}',
                                color: Colour.subtitleColor,
                                size: 12,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
