import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/authentication/authentication_cubit.dart';
import 'logic/banners/banners_cubit.dart';
import 'logic/combos/combos_cubit.dart';
import 'logic/location/location_cubit.dart';
import 'logic/brands/brands_cubit.dart';
import 'logic/best_sellers/bestsellers_cubit.dart';
import 'logic/new_products/new_products_cubit.dart';
import 'logic/category/category_cubit.dart';
import 'logic/theme/theme_cubit.dart';
import 'utils/export_utilities.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => ThemeCubit(),
        ),
        BlocProvider<CategoryCubit>(
          create: (BuildContext context) => CategoryCubit(),
        ),
        BlocProvider<BrandsCubit>(
          create: (BuildContext context) => BrandsCubit(),
        ),
        BlocProvider<NewProductsCubit>(
          create: (BuildContext context) => NewProductsCubit(),
        ),
        BlocProvider<BestsellersCubit>(
          create: (BuildContext context) => BestsellersCubit(),
        ),
        BlocProvider<CombosCubit>(
          create: (BuildContext context) => CombosCubit(),
        ),
        BlocProvider<BannersCubit>(
          create: (BuildContext context) => BannersCubit(),
        ),
        BlocProvider<LocationCubit>(
          create: (BuildContext context) => LocationCubit(),
        ),
        BlocProvider<AuthenticationCubit>(
          create: (BuildContext context) => AuthenticationCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (BuildContext context, ThemeData state) {
          return CustomMaterial(
            state: state,
          );
        },
      ),
    );
  }
}

class CustomMaterial extends StatelessWidget {
  const CustomMaterial({Key? key, required this.state}) : super(key: key);
  final ThemeData state;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kynd Shop',
      theme: state,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
