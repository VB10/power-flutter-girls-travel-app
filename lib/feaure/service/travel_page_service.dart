import 'package:travel_application/feaure/model/travel_model.dart';
import 'package:travel_application/feaure/service/ITravelService.dart';
import 'package:vexana/src/interface/INetworkService.dart';
import 'package:vexana/vexana.dart';

class TravelPageService extends ITravelService {
  TravelPageService(INetworkManager manager) : super(manager);

  @override
  Future<List<TravelModel>> fetctAllTravelPage() async {
    final response = await manager.send('travellers.json',
        parseModel: TravelModel(), method: RequestType.GET);

    return response.data ?? [];
  }
}
