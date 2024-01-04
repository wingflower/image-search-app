import 'package:flutter/material.dart';

import '../data/repository/image_item_repository.dart';
import 'main_state.dart';

class MainViewModel extends ChangeNotifier {
  // final _repository = PixabayImageItemRepository();
  final ImageItemRepository _repository;

  // MainState _state = MainState(
  //   imageItems: List.unmodifiable([]),
  //   isLoading: false,
  // );
  MainState _state = const MainState();

  MainState get state => _state;

  MainViewModel({
    required ImageItemRepository repository,
  }) : _repository = repository;

  // get repository => _repository;

  // List<ImageItem> _imageItems = [];
  //
  // List<ImageItem> get imageItems => List.unmodifiable(_imageItems);
  //
  // bool _isLoading = false;
  //
  // bool get isLoading => _isLoading;

  Future<bool> searchImage(String query, int numOfImages) async {
    // _isLoading = true;
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try{
      final results = (await _repository.getImageItems(query)).take(numOfImages).toList();
      _state = state.copyWith(
        isLoading: false,
        imageItems: results,
      );
      notifyListeners();
      return true;
    } catch (e) {
      return false;
    }
    // _state = state.copyWith(
    //   isLoading: false,
    //   imageItems: List.unmodifiable(
    //       (await _repository.getImageItems(query)).take(numOfImages).toList()),
    // );
    // _imageItems =
    //     (await _repository.getImageItems(query)).take(numOfImages).toList();

    // _isLoading = false;
    // notifyListeners();
  }
}
