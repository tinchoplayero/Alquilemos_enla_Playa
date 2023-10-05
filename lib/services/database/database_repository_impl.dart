import '../../pages/formulario/models/huesped.dart';
import 'database_service.dart';

class DatabaseRepositoryImpl implements DatabaseRepository {
  DatabaseService service = DatabaseService();

  @override
  Future<void> addHuesped(String alias, double depto, String fecha) {
    return service.addHuesped(alias, depto, fecha);
  }

  @override
  Future<List<Huesped>> getHuespedes() {
    return service.getHuespedes();
  }

  @override
  Stream<List<Huesped>> getHuespedesStream() {
    return service.getHuespedesStream();
  }

  @override
  Future<void> saveDummyData() {
    return service.saveDummyData();
  }
}

abstract class DatabaseRepository {
  Future<void> addHuesped(String alias, double depto, String fecha);
  Future<List<Huesped>> getHuespedes();
  Stream<List<Huesped>> getHuespedesStream();
  Future<void> saveDummyData();
}
