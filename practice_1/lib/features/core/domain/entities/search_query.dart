class SearchQuery {
  final String city;
  final double x;
  final double y;

  const SearchQuery.city(this.city): x = 0.0, y = 0.0;
  const SearchQuery.coords(this.x, this.y): city = '';
}
