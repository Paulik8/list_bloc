import 'package:flutter_list_bloc/example/pet_list/food_api_provider.dart';
import 'package:list_bloc/list_bloc.dart';
import 'models/food.dart';
import 'models/food_filter.dart';

class FoodRepository extends PaginatedRepository<Food, FoodFilter> {

  final FoodApiProvider _api = FoodApiProvider();

  var _loadedFood = List<Food>();

  @override
  Future<ListPage<Food>> load({FoodFilter filter}) async {
    final res = await _api.getFood(
      offset: filter.offset,
      limit: filter.limit,
    );
    _loadedFood.addAll(res.results);
    return ListPage(
      number: filter.offset == 0 ? 0 : filter.offset - 1,
      size: 1,
      count: _loadedFood.length,
      data: _loadedFood,
    );
  }
  
}