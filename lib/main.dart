import 'package:devexcuses/core/routes/app_router.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp.router(

      // debug et tests :
      debugShowCheckedModeBanner: false,
      checkerboardOffscreenLayers: false,
      checkerboardRasterCacheImages: false,
      showPerformanceOverlay: false,

      // routing :
      routerConfig: AppRouter().router,
    );
  }

}
