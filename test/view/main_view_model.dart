import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app_ver1/data/repository/image_item_repository.dart';
import 'package:image_search_app_ver1/data/repository/mock_image_item_repository_impl.dart';
import 'package:image_search_app_ver1/di/di_setup.dart';
import 'package:image_search_app_ver1/view/main_view_model.dart';

void main() {
  // 모든 테스트 시작할 때 호출 되는 부분
  setUp(() {
    getIt.registerSingleton<ImageItemRepository>(MockImageItemRepositoryImpl());

    // viewModel : factory
    getIt.registerFactory<MainViewModel>(
            () => MainViewModel(repository: getIt<ImageItemRepository>()));
  });

  test('이미지는 입력된 수만큼 반환되어야 한다', () async {
    final viewModel = getIt<MainViewModel>();
    final state = viewModel.state;

    expect(viewModel.state.imageItems.length, 0);

    await viewModel.searchImage('apple', 3);

    expect(viewModel.state.imageItems.length, 3);
    return null;
  });
}
