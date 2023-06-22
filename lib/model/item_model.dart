import 'package:hive/hive.dart';

part 'item_model.g.dart';

@HiveType(typeId: 0)
class ItemModel extends HiveObject {
@HiveField(0)
 final String name;
 @HiveField(1)
 final bool isFavourite;

 ItemModel({
required this.name,
required this.isFavourite,
});
}