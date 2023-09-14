import 'package:bloc/bloc.dart';

part 'compare_summary_event.dart';
part 'compare_summary_state.dart';

class CompareSummaryBloc
    extends Bloc<CompareSummaryEvent, CompareSummaryState> {
  CompareSummaryBloc() : super(CompareSummaryInitial()) {
    on<CompareSummaryEvent>((event, emit) {});
  }
}
