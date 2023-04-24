import 'package:hive/hive.dart';

part 'drink_model.g.dart';

@HiveType(typeId: 0)
class DrinkModel extends HiveObject {
@HiveField(0)
 final String name;
 @HiveField(1)
 final bool isFavourite;

 DrinkModel({
required this.name,
required this.isFavourite,
});
}