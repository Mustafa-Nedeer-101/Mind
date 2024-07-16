import 'package:get/get.dart';

class UserEntity {
  RxString name = ''.obs;
  RxString id = ''.obs;
  RxString image = ''.obs;
  RxString ranking = ''.obs;
  RxInt points = 0.obs;
  RxBool musicEnabled = true.obs;
  RxBool rankingUpdate = true.obs;

  UserEntity(
      {String? name,
      String? id,
      String? image,
      String? ranking,
      int? points,
      bool? musicEnabled,
      bool? rankingUpdate}) {
    this.name.value = name ?? '';
    this.id.value = id ?? '';
    this.image.value = image ?? '';
    this.ranking.value = ranking ?? '';
    this.points.value = points ?? 0;
    this.musicEnabled.value = musicEnabled ?? true;
    this.rankingUpdate.value = rankingUpdate ?? true;
  }
}
