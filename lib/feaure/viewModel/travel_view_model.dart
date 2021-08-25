import 'package:mobx/mobx.dart';
import 'package:travel_application/feaure/model/travel_model.dart';
import 'package:travel_application/feaure/service/ITravelService.dart';
part 'travel_view_model.g.dart';

class TravelViewModel = _TravelViewModelBase with _$TravelViewModel;

abstract class _TravelViewModelBase with Store {
  final ITravelService travelService;

  _TravelViewModelBase(this.travelService);

  @observable
  List<TravelModel> travelItems = [];

  @observable
  bool isLoading = false;

  @action
  void _changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future<void> fetcTravelItem() async {
    _changeLoading();
    travelItems = await travelService.fetctAllTravelPage();
    _changeLoading();
  }
}
