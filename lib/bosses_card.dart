import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/graphql/queries/bosses.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class BossesDisplayList extends StatelessWidget {
  const BossesDisplayList({super.key});

  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document:
            gql(eldenRingBosses), // this is the query string you just created
        variables: {'limit': 5, 'page': 0},
        pollInterval: const Duration(seconds: 10),
      ),
      // Just like in apollo refetch() could be used to manually trigger a refetch
      // while fetchMore() can be used for pagination purpose
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

              List<Widget> children = [
                Text(repository['name'] ?? ''),
                SizedBox(
                  height: 20,
                ),
                Text(repository['description'] ?? ''),
              ];

              if (repository['image'] != null) {
                children.add(
                  ClipRect(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.network(
                      repository['image'],
                      height: 200,
                    ),
                  ),
                );
              }

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  elevation: Constants.elevation,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: children,
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
