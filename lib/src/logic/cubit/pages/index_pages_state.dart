part of 'index_pages_cubit.dart';

class IndexPagesState extends Equatable {
  final int selectedPage;

  const IndexPagesState({
    required this.selectedPage,
  });

  IndexPagesState copyWith({int? select}) {
    return IndexPagesState(selectedPage: select ?? selectedPage);
  }

  @override
  List<Object?> get props => [selectedPage];
}
