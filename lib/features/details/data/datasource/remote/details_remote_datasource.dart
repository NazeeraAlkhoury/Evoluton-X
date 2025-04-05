import 'package:evoluton_x/features/details/data/models/details_model.dart';

abstract class DetailsRemoteDatasource {
  Future<DetailsModel> getDetails();
}
