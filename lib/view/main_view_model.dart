import 'package:flutter/material.dart';
import 'package:image_search_app_ver1/core/result.dart';
import 'package:image_search_app_ver1/data/model/image_item.dart';

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

  Future<void> searchImage(String query, int numOfImages) async {
    // _isLoading = true;
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _repository.getImageItems(query);

    switch (result) {
      case Success<List<ImageItem>>():
        _state = state.copyWith(
          isLoading: false,
          imageItems: result.data.take(numOfImages).toList(),
        );
        notifyListeners();
      case Error<List<ImageItem>>():
        print('Error!!!!');
      case Loading<List<ImageItem>>():
        print('Loading!!!!');
    }

    // try{
    //   final results = (await _repository.getImageItems(query)).take(numOfImages).toList();
    //   _state = state.copyWith(
    //     isLoading: false,
    //     imageItems: results,
    //   );
    //   notifyListeners();
    //   return true;
    // } catch (e) {
    //   return false;
    // }
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
