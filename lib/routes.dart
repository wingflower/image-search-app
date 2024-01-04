import 'package:go_router/go_router.dart';
import 'package:image_search_app_ver1/di/di_setup.dart';
import 'package:provider/provider.dart';

import 'view/main_screen.dart';
import 'view/main_view_model.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => getIt<MainViewModel>(),
        child: const MainScreen(),
      ),
    ),
  ],
);
