import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/graphql/queries/bosses.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BossesDisplayList extends StatelessWidget {
  const BossesDisplayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(eldenRingBosses),
        variables: {'limit': 15, 'page': 0},
        pollInterval: const Duration(seconds: 10),
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Text('Loading');
        }

        List? items = result.data?['boss'];

        if (items == null) {
          return const Text('No repositories');
        }

        return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final repository = items[index];

              List<Widget> children = [];

              if (repository['image'] != null) {
                children.add(
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 25.0, right: 25.0, top: 25.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image.network(
                        repository['image'],
                      ),
                    ),
                  ),
                );
              }

              children.add(
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25.0, top: 10.0, bottom: 10.0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Nome:", style: TextStyle(fontSize: 10))),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(repository['name'] ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                  .animate()
                                  .fadeIn(duration: 600.ms)
                                  .then(delay: 200.ms) // baseline=800ms
                                  .slide())),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Localização:",
                              style: TextStyle(fontSize: 10))),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(repository['location'])),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Descrição:",
                              style: TextStyle(fontSize: 10))),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(repository['description'] ?? '')),
                      ),
                    ],
                  ),
                ),
              );

              return Padding(
                padding: const EdgeInsets.all(25),
                child: Card(
                  elevation: Constants.elevation + 10,
                  child: Column(
                    children: children,
                  ),
                ),
              );
            });
      },
    );
  }
}
