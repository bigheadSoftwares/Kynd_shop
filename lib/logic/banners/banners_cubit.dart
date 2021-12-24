import 'package:bloc/bloc.dart';
import 'package:easy_coding/handle_error.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../utils/export_utilities.dart';
import '../../data/banners/banner_model.dart';
import '../../data/banners/banner_repository.dart';

part 'banners_state.dart';

class BannersCubit extends Cubit<BannersState> {
  BannersCubit() : super(BannersInitial());

  List<Widget> _list = const <Widget>[
    CustomImageWidget(image: Assets.banner),
    CustomImageWidget(image: Assets.banner),
    CustomImageWidget(image: Assets.banner),
  ];

  void getBanners() {
    BannerRepository.getBanner().then(
      (BannerModel bannerModel) {
        _list = <Widget>[];
        bannerModel.data!
            .map(
              (Datum e) => _list.add(
                const CustomImageWidget(image: Assets.banner),
              ),
            )
            .toList();
        emit(
          BannersLoaded(_list),
        );
      },
      onError: (dynamic error, dynamic stack) {
        emit(
          BannersFailure(
            handleError(error),
          ),
        );
      },
    );
  }
}
