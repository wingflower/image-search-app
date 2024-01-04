class ImageItem {
  String imageUrl;
  String tags;

//<editor-fold desc="Data Methods">
  ImageItem({
    required this.imageUrl,
    required this.tags,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          (other is ImageItem &&
              runtimeType == other.runtimeType &&
              imageUrl == other.imageUrl &&
              tags == other.tags);

  @override
  int get hashCode => imageUrl.hashCode ^ tags.hashCode;

  @override
  String toString() {
    return 'ImageItem{' + ' imageUrl: $imageUrl,' + ' tags: $tags,' + '}';
  }

  ImageItem copyWith({
    String? imageUrl,
    String? tags,
  }) {
    return ImageItem(
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': this.imageUrl,
      'tags': this.tags,
    };
  }

  factory ImageItem.fromJson(Map<String, dynamic> map) {
    return ImageItem(
      imageUrl: map['imageUrl'] as String,
      tags: map['tags'] as String,
    );
  }

//</editor-fold>
}

enum NumOfImages {
  one(1, 'one'),
  two(2, 'two'),
  three(3, 'three'),
  four(4, 'four'),
  five(5, 'five'),
  six(6, 'six'),
  seven(7, 'seven'),
  eight(8, 'eight'),
  nine(9, 'nine'),
  ten(10, 'ten');

  final int numOfImages;
  final String label;

  const NumOfImages(this.numOfImages, this.label);
}