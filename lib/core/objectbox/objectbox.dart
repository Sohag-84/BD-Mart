import 'package:gym_swat/features/product/data/models/product_obx_entity.dart';
import 'package:gym_swat/objectbox.g.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class ObjectBox {
  late final Store store;

  late final Box<ProductObxEntity> productBox;

  ObjectBox._create(this.store) {
    productBox = Box<ProductObxEntity>(store);
  }

  static Future<ObjectBox> create() async {
    final dir = await getApplicationDocumentsDirectory();
    final store = await openStore(
      directory: p.join(dir.path, 'gym_swat_obx'),
    );
    return ObjectBox._create(store);
  }
}
