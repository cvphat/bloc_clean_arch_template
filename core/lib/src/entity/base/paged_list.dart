import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'paged_list.freezed.dart';

@freezed
class PagedList<T> with _$PagedList<T> {
  const PagedList._();

  const factory PagedList({
    required List<T> data,
    @Default(null) Object? otherData,
    @Default(0) int next,
    @Default(0) int offset,
    @Default(0) int total,
  }) = _PagedList;

  bool get isLastPage => data.isEmpty || (total > 0 && next * offset >= total);

  LoadMoreOutput<T> toLoadMoreOutput() {
    return LoadMoreOutput(
        data: data, otherData: otherData, isLastPage: isLastPage);
  }
}
