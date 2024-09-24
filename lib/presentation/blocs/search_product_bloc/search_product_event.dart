abstract class SearchProductsEvent {}

class SearchAllProductsEvent extends SearchProductsEvent {
  final String? term;
  final int? page;

  SearchAllProductsEvent({this.term, this.page});
}
