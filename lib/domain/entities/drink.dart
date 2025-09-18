import 'menu_item.dart';

// Concrete Drink entity.
// Inheritance from MenuItem; adds isHot (extension of behavior).
class Drink extends MenuItem {
  final bool isHot;
  Drink({
    required super.id,
    required super.name,
    required super.price,
    required super.category,
    required this.isHot,
  });

  @override
  String describe() =>
      "${isHot ? 'Hot' : 'Cold'} Drink: $name - EGP ${price.toStringAsFixed(2)}";
}
