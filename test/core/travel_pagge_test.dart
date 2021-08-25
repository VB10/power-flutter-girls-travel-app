import 'package:flutter_test/flutter_test.dart';
import 'package:travel_application/core/constants/app_constants.dart';
import 'package:travel_application/feaure/model/travel_model.dart';
import 'package:vexana/vexana.dart';

void main() {
  INetworkManager? manager;
  setUp(() {
    manager =
        NetworkManager(options: BaseOptions(baseUrl: AppConstants.baseURl));
  });
  test('Travel Fetch All datas', () async {
    final response = await manager?.send('travellers.json',
        parseModel: TravelModel(), method: RequestType.GET);

    expect(response, isNotNull);
  });
}
