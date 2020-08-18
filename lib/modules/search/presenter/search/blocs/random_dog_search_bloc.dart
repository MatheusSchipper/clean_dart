import 'package:bloc/bloc.dart';
import 'package:clean_dart/modules/search/domain/usecases/search_random_dog.dart';
import 'package:clean_dart/modules/search/presenter/search/states/state.dart';

class RandomDogSearchBloc extends Bloc<String, ISearchState> {
  final ISearchRandomDog usecase;

  RandomDogSearchBloc(this.usecase) : super(LoadingSearchState());

  @override
  Stream<ISearchState> mapEventToState(String event) async* {
    yield LoadingSearchState();
    final result = await usecase();
    yield result.fold(
      (l) => ErrorSearchState(l),
      (r) => SuccessRandomDogSearch(r),
    );
  }
}
