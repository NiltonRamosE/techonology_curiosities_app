import '../entities/curiosity.dart';
import '../repositories/curiosity_repository.dart';

class GetCuriosities {
  final CuriosityRepository repository;

  GetCuriosities(this.repository);

  Future<List<Curiosity>> call() {
    return repository.getCuriosities();
  }
}
