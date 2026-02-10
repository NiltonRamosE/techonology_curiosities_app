import '../../domain/entities/curiosity.dart';
import '../../domain/repositories/curiosity_repository.dart';
import '../services/curiosity_api_service.dart';

class CuriosityRepositoryImpl implements CuriosityRepository {
  final CuriosityApiService apiService;

  CuriosityRepositoryImpl(this.apiService);

  @override
  Future<List<Curiosity>> getCuriosities() {
    return apiService.fetchCuriosities();
  }
}
