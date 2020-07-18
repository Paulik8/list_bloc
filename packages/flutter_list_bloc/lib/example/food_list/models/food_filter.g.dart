// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_filter.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$FoodFilter extends FoodFilter {
  @override
  final int offset;
  @override
  final int limit;

  factory _$FoodFilter([void Function(FoodFilterBuilder) updates]) =>
      (new FoodFilterBuilder()..update(updates)).build();

  _$FoodFilter._({this.offset, this.limit}) : super._() {
    if (offset == null) {
      throw new BuiltValueNullFieldError('FoodFilter', 'offset');
    }
    if (limit == null) {
      throw new BuiltValueNullFieldError('FoodFilter', 'limit');
    }
  }

  @override
  FoodFilter rebuild(void Function(FoodFilterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FoodFilterBuilder toBuilder() => new FoodFilterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is FoodFilter &&
        offset == other.offset &&
        limit == other.limit;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, offset.hashCode), limit.hashCode));
  }
}

class FoodFilterBuilder implements Builder<FoodFilter, FoodFilterBuilder> {
  _$FoodFilter _$v;

  int _offset;
  int get offset => _$this._offset;
  set offset(int offset) => _$this._offset = offset;

  int _limit;
  int get limit => _$this._limit;
  set limit(int limit) => _$this._limit = limit;

  FoodFilterBuilder() {
    FoodFilter._initializeBuilder(this);
  }

  FoodFilterBuilder get _$this {
    if (_$v != null) {
      _offset = _$v.offset;
      _limit = _$v.limit;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(FoodFilter other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$FoodFilter;
  }

  @override
  void update(void Function(FoodFilterBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$FoodFilter build() {
    final _$result = _$v ?? new _$FoodFilter._(offset: offset, limit: limit);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
