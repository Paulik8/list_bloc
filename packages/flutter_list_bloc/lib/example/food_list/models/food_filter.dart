import 'package:built_value/built_value.dart';
import 'package:list_bloc/list_bloc.dart';

part 'food_filter.g.dart';

abstract class FoodFilter extends Object implements OffsetLimitFilter, Built<FoodFilter, FoodFilterBuilder> {
  FoodFilter._();

  factory FoodFilter([void Function(FoodFilterBuilder) updates]) = _$FoodFilter;

  static void _initializeBuilder(FoodFilterBuilder b) => b
    ..offset = 0
    ..limit = 3;

  @override
  String toString() => "$runtimeType: pets";
}