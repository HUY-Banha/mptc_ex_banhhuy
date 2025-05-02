import 'dart:developer';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Import flutter_bloc
import 'package:mptc_exercise_banhahuy/core/blocs/language_cubit.dart'; // Import LanguageCubit
import 'package:mptc_exercise_banhahuy/core/injection/injection.dart';
import 'package:mptc_exercise_banhahuy/core/l10n/l10n.dart'; // Import localization files
import 'package:mptc_exercise_banhahuy/core/routing/router.dart';
import 'package:mptc_exercise_banhahuy/feature/home/domain/usecases/category_usecase.dart';
import 'package:mptc_exercise_banhahuy/feature/home/presentation/bloc/category/category_bloc.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/domain/usecases/profile_usecase.dart';
import 'package:mptc_exercise_banhahuy/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:mptc_exercise_banhahuy/native_bridge.dart';
// Import HomePage

import 'core/themes/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(getIt<ProfileUsecase>())..add(ProfileStarted()),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(getIt<CategoryUsecase>(),)..add(CategoryStarted()),
        ),
      ],
      child: BlocBuilder<LanguageCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: AppThemes.lightTheme,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: locale, // Set the locale from the cubit state
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('km', 'KH'),
            ],
            routerConfig: AppRouter.router,
            // home: const HomePage(),
          );
        },
      ),
    );
  }
}
