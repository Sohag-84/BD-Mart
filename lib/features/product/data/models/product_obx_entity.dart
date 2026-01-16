import 'package:objectbox/objectbox.dart';

@Entity()
class ProductObxEntity {
  @Id()
  int id; //local db id

  int productId; //api product id
  String name;
  String image;
  String price;
  String discount;
  double rating;

  ProductObxEntity({
    this.id = 0,
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.discount,
    required this.rating,
  });
}
