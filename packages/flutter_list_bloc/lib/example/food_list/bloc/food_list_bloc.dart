import 'package:flutter_list_bloc/example/food_list/food_repository.dart';
import 'package:flutter_list_bloc/example/food_list/models/food.dart';
import 'package:flutter_list_bloc/example/food_list/models/food_filter.dart';
import 'package:list_bloc/list_bloc.dart';

class FoodListBloc extends PaginatedBloc<Food, FoodFilter> {

  FoodListBloc(FoodRepository repository) : super(repository);
}