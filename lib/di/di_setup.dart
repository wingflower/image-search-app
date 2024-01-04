import 'package:get_it/get_it.dart';
import 'package:image_search_app_ver1/data/repository/image_item_repository.dart';
import 'package:image_search_app_ver1/data/repository/image_item_repository_impl.dart';
import 'package:image_search_app_ver1/view/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<ImageItemRepository>(ImageItemRepositoryImpl());

  getIt.registerFactory(
      () => MainViewModel(repository: getIt<ImageItemRepository>()));
}
