import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wts_test/repositories/category/abstract_category_repository.dart';
import 'package:wts_test/repositories/category/models/category_model.dart';

part 'category_state.dart';

part 'category_event.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc(this.categoryRepository) : super(CategoryInitial()) {
    on<LoadCategoryList>((event, emit) async {
      try {
        if (state is! CategoryListLoaded) {
          emit(CategoryListLoading());
        }
        final categoryList = await categoryRepository.getCategoriesList();
        emit(CategoryListLoaded(categoryList: categoryList));
      } catch (e) {
        emit(CategoryListLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }

  final AbstractCategoryRepository categoryRepository;
}
