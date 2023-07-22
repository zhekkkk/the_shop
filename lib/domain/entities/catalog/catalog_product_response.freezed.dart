// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_product_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CatalogProductResponse _$CatalogProductResponseFromJson(
    Map<String, dynamic> json) {
  return _CatalogProductResponse.fromJson(json);
}

/// @nodoc
mixin _$CatalogProductResponse {
  List<Product> get results => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CatalogProductResponseCopyWith<CatalogProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogProductResponseCopyWith<$Res> {
  factory $CatalogProductResponseCopyWith(CatalogProductResponse value,
          $Res Function(CatalogProductResponse) then) =
      _$CatalogProductResponseCopyWithImpl<$Res, CatalogProductResponse>;
  @useResult
  $Res call({List<Product> results, int count, String? next});
}

/// @nodoc
class _$CatalogProductResponseCopyWithImpl<$Res,
        $Val extends CatalogProductResponse>
    implements $CatalogProductResponseCopyWith<$Res> {
  _$CatalogProductResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? count = null,
    Object? next = freezed,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CatalogProductResponseCopyWith<$Res>
    implements $CatalogProductResponseCopyWith<$Res> {
  factory _$$_CatalogProductResponseCopyWith(_$_CatalogProductResponse value,
          $Res Function(_$_CatalogProductResponse) then) =
      __$$_CatalogProductResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Product> results, int count, String? next});
}

/// @nodoc
class __$$_CatalogProductResponseCopyWithImpl<$Res>
    extends _$CatalogProductResponseCopyWithImpl<$Res,
        _$_CatalogProductResponse>
    implements _$$_CatalogProductResponseCopyWith<$Res> {
  __$$_CatalogProductResponseCopyWithImpl(_$_CatalogProductResponse _value,
      $Res Function(_$_CatalogProductResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? count = null,
    Object? next = freezed,
  }) {
    return _then(_$_CatalogProductResponse(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CatalogProductResponse implements _CatalogProductResponse {
  _$_CatalogProductResponse(
      {required final List<Product> results,
      required this.count,
      required this.next})
      : _results = results;

  factory _$_CatalogProductResponse.fromJson(Map<String, dynamic> json) =>
      _$$_CatalogProductResponseFromJson(json);

  final List<Product> _results;
  @override
  List<Product> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final int count;
  @override
  final String? next;

  @override
  String toString() {
    return 'CatalogProductResponse(results: $results, count: $count, next: $next)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CatalogProductResponse &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_results), count, next);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CatalogProductResponseCopyWith<_$_CatalogProductResponse> get copyWith =>
      __$$_CatalogProductResponseCopyWithImpl<_$_CatalogProductResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CatalogProductResponseToJson(
      this,
    );
  }
}

abstract class _CatalogProductResponse implements CatalogProductResponse {
  factory _CatalogProductResponse(
      {required final List<Product> results,
      required final int count,
      required final String? next}) = _$_CatalogProductResponse;

  factory _CatalogProductResponse.fromJson(Map<String, dynamic> json) =
      _$_CatalogProductResponse.fromJson;

  @override
  List<Product> get results;
  @override
  int get count;
  @override
  String? get next;
  @override
  @JsonKey(ignore: true)
  _$$_CatalogProductResponseCopyWith<_$_CatalogProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
