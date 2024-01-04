import 'package:flutter/material.dart';

import '../data/model/image_item.dart';
import '../data/repository/image_item_repository.dart';

class MainViewModel extends ChangeNotifier {
  // final _repository = PixabayImageItemRepository();
  final ImageItemRepository _repository;

  MainViewModel({
    required ImageItemRepository repository,
  }) : _repository = repository;

  // get repository => _repository;

  List<ImageItem> _imageItems = [];

  List<ImageItem> get imageItems => List.unmodifiable(_imageItems);

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> searchImage(String query, int numOfImages) async {
    _isLoading = true;
    notifyListeners();

    _imageItems =
        (await _repository.getImageItems(query)).take(numOfImages).toList();

    _isLoading = false;
    notifyListeners();
  }
}
