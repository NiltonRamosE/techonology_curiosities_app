import '../entities/curiosity.dart';

abstract class CuriosityRepository {
  Future<List<Curiosity>> getCuriosities();
}
