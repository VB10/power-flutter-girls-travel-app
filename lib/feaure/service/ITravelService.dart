import 'package:travel_application/feaure/model/travel_model.dart';
import 'package:vexana/vexana.dart';

abstract class ITravelService {
  final INetworkManager manager;

  ITravelService(this.manager);

  Future<List<TravelModel>> fetctAllTravelPage();
}
