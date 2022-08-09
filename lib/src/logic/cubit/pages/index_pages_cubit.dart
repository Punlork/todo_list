import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'index_pages_state.dart';

class IndexPagesCubit extends Cubit<IndexPagesState> {
  IndexPagesCubit() : super(const IndexPagesState(selectedPage: 0));

  void onTapedIndex(int i) {
    emit(state.copyWith(select: i));
  }
}
