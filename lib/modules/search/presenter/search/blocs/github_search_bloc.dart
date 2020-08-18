import 'package:bloc/bloc.dart';
import 'package:clean_dart/modules/search/domain/usecases/search_by_text.dart';
import 'package:clean_dart/modules/search/presenter/search/states/state.dart';
import 'package:rxdart/rxdart.dart';

class GithubSearchBloc extends Bloc<String, ISearchState> {
  final ISearchByText usecase;
  GithubSearchBloc(this.usecase) : super(StartSearchState());

  @override
  Stream<ISearchState> mapEventToState(String searchText) async* {
    yield LoadingSearchState();
    final result = await usecase(searchText);
    yield result.fold(
      (l) => ErrorSearchState(l),
      (r) => SuccessSearchState(r),
    );
  }

  @override
  Stream<Transition<String, ISearchState>> transformEvents(
      Stream<String> events, transitionFn) {
    return super.transformEvents(
        events.debounceTime(
          Duration(milliseconds: 800),
        ),
        transitionFn);
  }
}
