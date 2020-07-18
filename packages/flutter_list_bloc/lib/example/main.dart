import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list_bloc/example/pet_list/bloc/food_list_bloc.dart';
import 'package:flutter_list_bloc/example/pet_list/food_repository.dart';
import 'package:flutter_list_bloc/example/pet_list/ui/food_list.dart';

void main() {
  final foodRepository = FoodRepository();
  runApp(MyApp(foodRepository: foodRepository,));
}

class MyApp extends StatelessWidget {

  final foodRepository;

  const MyApp({
    this.foodRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodListBloc>(
            create: (context) => FoodListBloc(foodRepository),
          ),
      ], 
      child: MaterialApp(
        home: FoodList(),
      )
    );
  }
}