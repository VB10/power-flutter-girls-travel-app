// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TravelViewModel on _TravelViewModelBase, Store {
  final _$travelItemsAtom = Atom(name: '_TravelViewModelBase.travelItems');

  @override
  List<TravelModel> get travelItems {
    _$travelItemsAtom.reportRead();
    return super.travelItems;
  }

  @override
  set travelItems(List<TravelModel> value) {
    _$travelItemsAtom.reportWrite(value, super.travelItems, () {
      super.travelItems = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_TravelViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$fetcTravelItemAsyncAction =
      AsyncAction('_TravelViewModelBase.fetcTravelItem');

  @override
  Future<void> fetcTravelItem() {
    return _$fetcTravelItemAsyncAction.run(() => super.fetcTravelItem());
  }

  final _$_TravelViewModelBaseActionController =
      ActionController(name: '_TravelViewModelBase');

  @override
  void _changeLoading() {
    final _$actionInfo = _$_TravelViewModelBaseActionController.startAction(
        name: '_TravelViewModelBase._changeLoading');
    try {
      return super._changeLoading();
    } finally {
      _$_TravelViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
travelItems: ${travelItems},
isLoading: ${isLoading}
    ''';
  }
}
