import 'package:clean_dart/modules/search/presenter/search/blocs/random_dog_search_bloc.dart';
import 'package:clean_dart/modules/search/presenter/search/states/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RandomDogSearchPage extends StatefulWidget {
  @override
  _RandomDogSearchPageState createState() => _RandomDogSearchPageState();
}

class _RandomDogSearchPageState extends State<RandomDogSearchPage> {
  final bloc = Modular.get<RandomDogSearchBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add("search");
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(FontAwesomeIcons.dog),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StreamBuilder(
              stream: bloc,
              builder: (context, _) {
                final state = bloc.state;
                if (state is LoadingSearchState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ErrorSearchState) {
                  return Center(
                    child: Text("ops... um erro aconteceu"),
                  );
                }
                final entity = (state as SuccessRandomDogSearch).entity;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    entity.url,
                    height: MediaQuery.of(context).size.height * 0.75,
                  ),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              onPressed: () {
                bloc.add("search");
              },
              child: Text("Quero mais!"),
            ),
          ],
        ),
      ),
    );
  }
}
