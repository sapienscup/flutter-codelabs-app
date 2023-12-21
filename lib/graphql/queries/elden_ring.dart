import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String eldenRingBosses = """
query EldenRingBosses(\$limit: Int!, \$page: Int!) {
  boss(limit: \$limit, page: \$page) {
    id
    name
    image
    description
    location
    healthPoints
  }
}
""";

class QueryBosses {
  perform() {
    final readRespositoriesResult = useQuery(
      QueryOptions(
        document: gql(eldenRingBosses),
        variables: {"page": 0, "limit": 5},
        pollInterval: const Duration(seconds: 10),
      ),
    );

    final result = readRespositoriesResult.result;

    if (result.hasException) {
      return Text(result.exception.toString());
    }

    if (result.isLoading) {
      return const Text('Loading');
    }

    List? rsp = result.data?['boss'];

    if (rsp == null) {
      return const Text('No repositories');
    }
  }
}
