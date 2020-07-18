import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_list_bloc/example/food_list/bloc/food_list_bloc.dart';
import 'package:flutter_list_bloc/example/food_list/models/food.dart';
import 'package:flutter_list_bloc/example/food_list/models/food_filter.dart';
import 'package:flutter_list_bloc/flutter_list_bloc.dart';
import 'package:list_bloc/list_bloc.dart';

class FoodList extends StatefulWidget {

  @override
  FoodListState createState() => FoodListState();

}

class FoodListState extends State<FoodList> {

  FoodListBloc _listBloc;
  int _currentPage;

  @override
  void initState() {
    super.initState();
    _listBloc = BlocProvider.of<FoodListBloc>(context);
    _loadNextData(_listBloc.state.filter);
    _currentPage = 0;
  } 

  Widget _buildItem(Food item) =>
    Container(
      key: Key(item.id.toString()),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12),
            height: 231,
            width: 312,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: NetworkImage(item.image,),
                fit: BoxFit.cover
              )
            ),
          ),
          Container(
            child: Text(
              '${item.title}',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black
              ),
            ),
          )
        ],
      )
    );

  Widget _buildContent(DataState state) {
    if (state is DataEmpty) {
      return Container(
        color: Colors.red,
        child: Center(
          child: Text(
            'Empty',
            style: TextStyle(
              color: Colors.black
            ),
          ),
        ),
      );
    } else if (state is DataLoaded) {
      return _buildItem(state.data.data[_currentPage]);
    } else if (state is DataLoading) {
      return state.data.data.isEmpty ? Center(child: CircularProgressIndicator()) : _buildItem(state.data.data[_currentPage]);
    } 
  }

  void _loadNextData(FoodFilter filter) =>
    _listBloc.load(filter == null ? FoodFilter((b) => b
        ..limit = b.limit
        ..offset = 0
      ) : filter.rebuild((b) => b
        ..limit = b.limit
        ..offset = b.offset + b.limit
      )
    );

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      body: Container(
        color: Colors.grey[200],
        child: PageViewBlocBuilder<Food, FoodFilter>(
          bloc: _listBloc,
          onPageChanged: (context, state, index) {
            setState(() {
              _currentPage = index;
              if (state.data.pages - 1 == index)
                _loadNextData(state.filter);
            });
          },
          pageBuilder: (context, state) => _buildContent(state),
          emptyBuilder: (context, state) => _buildContent(state),
        )
      )
    );
}