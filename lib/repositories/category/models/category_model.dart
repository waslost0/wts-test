import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int categoryId;
  final String title;
  final String? imageUrl;
  final int hasSubcategories;
  final String fullName;
  final String categoryDescription;

  const Category({
    required this.categoryId,
    required this.title,
    this.imageUrl,
    required this.hasSubcategories,
    required this.fullName,
    required this.categoryDescription,
  });

  @override
  List<Object?> get props => [
        categoryId,
        title,
        imageUrl,
        hasSubcategories,
        fullName,
        categoryDescription,
      ];
}