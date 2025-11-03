import '../../domain/entity/coffee.dart';
import '../../domain/repository/coffee_repository.dart';
import '../source/coffee_remote_data_source.dart';

class CoffeeRepositoryImpl implements CoffeeRepository {
  final CoffeeRemoteDataSource remoteDataSource;

  CoffeeRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Coffee>> getAllCoffees() async {
    return await remoteDataSource.getCoffees();
  }
}
