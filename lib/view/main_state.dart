import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import '../data/model/image_item.dart';

part 'main_state.freezed.dart';
part 'main_state.g.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default([]) List<ImageItem> imageItems,
    @Default(false) bool isLoading,
  }) = _MainState;

  factory MainState.fromJson(Map<String, Object?> json) => _$MainStateFromJson(json);
}

// class MainState {
//   final List<ImageItem> imageItems;
//
//   final bool isLoading;
//
// //<editor-fold desc="Data Methods">
//   const MainState({
//     required this.imageItems,
//     required this.isLoading,
//   });
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       (other is MainState &&
//           runtimeType == other.runtimeType &&
//           imageItems == other.imageItems &&
//           isLoading == other.isLoading);
//
//   @override
//   int get hashCode => imageItems.hashCode ^ isLoading.hashCode;
//
//   @override
//   String toString() {
//     return 'MainState{' +
//         ' imageItems: $imageItems,' +
//         ' isLoading: $isLoading,' +
//         '}';
//   }
//
//   MainState copyWith({
//     List<ImageItem>? imageItems,
//     bool? isLoading,
//   }) {
//     return MainState(
//       imageItems: imageItems ?? this.imageItems,
//       isLoading: isLoading ?? this.isLoading,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'imageItems': this.imageItems,
//       'isLoading': this.isLoading,
//     };
//   }
//
//   factory MainState.fromJson(Map<String, dynamic> map) {
//     return MainState(
//       imageItems: map['imageItems'] as List<ImageItem>,
//       isLoading: map['isLoading'] as bool,
//     );
//   }
//
// //</editor-fold>
// }
