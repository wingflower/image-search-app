import 'package:flutter/material.dart';

import '../data/model/image_item.dart';
import '../data/repository/image_item_repository.dart';

class MainViewModel extends ChangeNotifier {
  final _repository = PixabayImageItemRepository();

  get repository => _repository;

  List<ImageItem> _imageItems = [];

  List<ImageItem> get imageItems => _imageItems;

  bool isLoading = false;

  Future<void> searchImage(String query) async {
    isLoading = true;
    notifyListeners();

    _imageItems = await repository.getImageItems(query);

    isLoading = false;
    notifyListeners();
  }
}