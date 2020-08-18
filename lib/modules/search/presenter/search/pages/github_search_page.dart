import 'package:clean_dart/modules/search/presenter/search/blocs/github_search_bloc.dart';
import 'package:clean_dart/modules/search/presenter/search/states/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GithubSearchPage extends StatefulWidget {
  @override
  _GithubSearchPageState createState() => _GithubSearchPageState();
}

class _GithubSearchPageState extends State<GithubSearchPage> {
  final bloc = Modular.get<GithubSearchBloc>();

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 8.0,
              right: 8.0,
            ),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Search..."),
              onChanged: bloc.add,
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: bloc,
                builder: (context, snapshot) {
                  final state = bloc.state;

                  if (state is StartSearchState) {
                    return Center(
                      child: Text("Digite um texto"),
                    );
                  }
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
                  final list = (state as SuccessSearchState).list;
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, id) {
                      final item = list[id];
                      return ListTile(
                        title: Text(item.title ?? ""),
                        subtitle: Text(item.content ?? ""),
                        leading: item.img == null
                            ? Container()
                            : CircleAvatar(
                                backgroundImage: NetworkImage(item.img),
                              ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
