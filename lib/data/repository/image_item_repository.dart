import '../../core/result.dart';
import '../data_source/pixabay_api.dart';
import '../mapper/image_mapper.dart';
import '../model/image_item.dart';

abstract interface class ImageItemRepository {
  Future<Result<List<ImageItem>>> getImageItems(String query);
}