import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class EldenRingApi {
  ValueNotifier<GraphQLClient> init() {
    final HttpLink httpLink = HttpLink(
      'https://eldenring.fanapis.com/api/graphql',
    );

    final AuthLink authLink = AuthLink(
      getToken: () async => 'Bearer',
    );

    final Link link = authLink.concat(httpLink);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(store: HiveStore()),
      ),
    );

    return client;
  }
}
