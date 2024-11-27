import 'package:fruits_app/generated/assets.dart';

import '../../../../generated/l10n.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String label;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.label});
}

List<BottomNavigationBarEntity> get bottomNavigationItems => [
      BottomNavigationBarEntity(
          activeImage: Assets.svgsHomeSelected,
          inActiveImage: Assets.svgsHome,
          label: S.current.home),
      BottomNavigationBarEntity(
          activeImage: Assets.svgsProductsSelected,
          inActiveImage: Assets.svgsProducts,
          label: S.current.products),
      BottomNavigationBarEntity(
          activeImage: Assets.svgsShoppingCartSelected,
          inActiveImage: Assets.svgsShoppingCart,
          label: S.current.shopping_cart),
      BottomNavigationBarEntity(
          activeImage: Assets.svgsUserSelected,
          inActiveImage: Assets.svgsUser,
          label: S.current.profile),
    ];
