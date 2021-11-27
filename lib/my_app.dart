import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic/brands/brands_cubit.dart';
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
      initialRoute: Routes.home,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
