import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:mptc_exercise_banhahuy/core/l10n/l10n.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(Locale('en, US'));

  void changeLanguage(Locale locale) {
    AppLocalizations.load(locale);
    emit(locale);
  }

}
