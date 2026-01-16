import 'package:objectbox/objectbox.dart';

@Entity()
class SliderObxEntity {
  @Id()
  int id;
  final String photo;

  SliderObxEntity({this.id = 0, required this.photo});
}
