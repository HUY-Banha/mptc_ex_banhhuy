import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mptc_exercise_banhahuy/core/blocs/language_cubit.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            if (locale == Locale('en', 'US')) {
              context.read<LanguageCubit>().changeLanguage(Locale('km', 'KH'));
            } else {
              context.read<LanguageCubit>().changeLanguage(Locale('en', 'US'));
            }
          },
          child: Flag.fromCode(
            locale != Locale('en', 'US') ? FlagsCode.US : FlagsCode.KH,
            height: 32,
            width: 32,
          ),
        );
      },
    );
  }
}
