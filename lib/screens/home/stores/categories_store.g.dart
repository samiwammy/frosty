// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriesStore on CategoriesStoreBase, Store {
  late final _$showJumpButtonAtom =
      Atom(name: 'CategoriesStoreBase.showJumpButton', context: context);

  @override
  bool get showJumpButton {
    _$showJumpButtonAtom.reportRead();
    return super.showJumpButton;
  }

  @override
  set showJumpButton(bool value) {
    _$showJumpButtonAtom.reportWrite(value, super.showJumpButton, () {
      super.showJumpButton = value;
    });
  }

  late final _$_categoriesAtom =
      Atom(name: 'CategoriesStoreBase._categories', context: context);

  ObservableList<CategoryTwitch> get categories {
    _$_categoriesAtom.reportRead();
    return super._categories;
  }

  @override
  ObservableList<CategoryTwitch> get _categories => categories;

  @override
  set _categories(ObservableList<CategoryTwitch> value) {
    _$_categoriesAtom.reportWrite(value, super._categories, () {
      super._categories = value;
    });
  }

  late final _$_errorAtom =
      Atom(name: 'CategoriesStoreBase._error', context: context);

  String? get error {
    _$_errorAtom.reportRead();
    return super._error;
  }

  @override
  String? get _error => error;

  @override
  set _error(String? value) {
    _$_errorAtom.reportWrite(value, super._error, () {
      super._error = value;
    });
  }

  late final _$getCategoriesAsyncAction =
      AsyncAction('CategoriesStoreBase.getCategories', context: context);

  @override
  Future<void> getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  late final _$CategoriesStoreBaseActionController =
      ActionController(name: 'CategoriesStoreBase', context: context);

  @override
  Future<void> refreshCategories() {
    final _$actionInfo = _$CategoriesStoreBaseActionController.startAction(
        name: 'CategoriesStoreBase.refreshCategories');
    try {
      return super.refreshCategories();
    } finally {
      _$CategoriesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showJumpButton: ${showJumpButton}
    ''';
  }
}
