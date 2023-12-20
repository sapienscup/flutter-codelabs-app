String readRepositories = """
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
