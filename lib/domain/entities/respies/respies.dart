import 'package:equatable/equatable.dart';

class Recipes extends Equatable {
  final String id;
  final String name;
  final String image;

  const Recipes({
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [id];
}
