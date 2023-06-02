import 'package:devexcuses/core/routes/app_router.dart';
import 'package:devexcuses/core/translations/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main()
{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DevExcusesApp());
}

class DevExcusesApp extends StatelessWidget
{
  const DevExcusesApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return ProviderScope(
      child: MaterialApp.router(

        // debug et tests :
        debugShowCheckedModeBanner: false,
        checkerboardOffscreenLayers: false,
        checkerboardRasterCacheImages: false,
        showPerformanceOverlay: false,

        // traductions :
        supportedLocales: L10n.all,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],

        // routing :
        routerConfig: AppRouter().router,
      ),
    );
  }

}
