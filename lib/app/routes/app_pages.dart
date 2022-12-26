import 'package:get/get.dart';

import '../modules/darwer/bindings/darwer_binding.dart';
import '../modules/darwer/views/darwer_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dictionary/bindings/dictationary_binding.dart';
import '../modules/dictionary/views/dictionary_view.dart';
import '../modules/feedback/bindings/feedback_binding.dart';
import '../modules/feedback/views/feedback_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/image_text_translator/bindings/image_text_translator_binding.dart';
import '../modules/image_text_translator/views/image_text_translator_view.dart';
import '../modules/languages/bindings/languages_binding.dart';
import '../modules/languages/views/languages_view.dart';
import '../modules/multi_translator/bindings/multi_translator_binding.dart';
import '../modules/multi_translator/views/multi_translator_view.dart';
import '../modules/rate_us/bindings/rate_us_binding.dart';
import '../modules/rate_us/views/rate_us_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/uni_translator/bindings/uni_translator_binding.dart';
import '../modules/uni_translator/views/uni_translator_view.dart';
import '../modules/voice_translator/bindings/voice_translator_binding.dart';
import '../modules/voice_translator/views/voice_translator_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.DARWER,
      page: () => const DarwerView(),
      binding: DarwerBinding(),
    ),
    GetPage(
      name: _Paths.UNI_TRANSLATOR,
      page: () => const UniTranslatorView(),
      binding: UniTranslatorBinding(),
    ),
    GetPage(
      name: _Paths.MULTI_TRANSLATOR,
      page: () =>  MultiTranslatorView(),
      binding: MultiTranslatorBinding(),
    ),
    GetPage(
      name: _Paths.VOICE_TRANSLATOR,
      page: () =>  VoiceTranslatorView(),
      binding: VoiceTranslatorBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE_TEXT_TRANSLATOR,
      page: () => const ImageTextTranslatorView(),
      binding: ImageTextTranslatorBinding(),
    ),
    GetPage(
      name: _Paths.DICTATIONARY,
      page: () => const DictionaryView(),
      binding: DictionaryBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => const FeedbackView(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: _Paths.RATE_US,
      page: () => const RateUsView(),
      binding: RateUsBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.LANGUAGES,
      page: () =>  LanguagesView(),
      binding: LanguagesBinding(),
    ),
  ];
}
