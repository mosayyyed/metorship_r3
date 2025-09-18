import '../entities/menu_item.dart';
import '../entities/category.dart';

// MenuRepository abstraction (DIP target)
abstract class MenuRepository {
  List<MenuItem> getAll();
  MenuItem? getById(String id);
  void add(MenuItem item);
  void update(MenuItem item);
  void delete(String id);
  List<Category> getCategories();
  void addCategory(Category category);
  void deleteCategory(String name);
}
