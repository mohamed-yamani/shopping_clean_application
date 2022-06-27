import 'package:hive/hive.dart';
import 'package:petshop/domain/entites/product_entity.dart';

part 'product_table.g.dart';

@HiveType(typeId: 0)
class ProductTable extends ProductEntity {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? nom;
  @HiveField(2)
  final String? photoPrincipal;
  @HiveField(3)
  final double? prix;
  @HiveField(4)
  final bool? favoris;
  @HiveField(5)
  final double? longeurParLargeur;
  @HiveField(6)
  final double? nombrePhotoCarroussel;

  const ProductTable({
    required this.id,
    required this.nom,
    required this.photoPrincipal,
    required this.prix,
    required this.favoris,
    required this.longeurParLargeur,
    required this.nombrePhotoCarroussel,
  }) :  super(
           id: id,
          nom: nom,
          photoPrincipal: photoPrincipal,
          prix: prix,
          favoris: favoris,
          longeurParLargeur: longeurParLargeur,
          nombrePhotoCarroussel: nombrePhotoCarroussel,
        
  );

  factory ProductTable.fromProductEntity(ProductEntity productEntity) {
    return ProductTable(
      id: productEntity.id,
      nom: productEntity.nom,
      photoPrincipal: productEntity.photoPrincipal,
      prix: productEntity.prix,
      favoris: productEntity.favoris,
      longeurParLargeur: productEntity.longeurParLargeur,
      nombrePhotoCarroussel: productEntity.nombrePhotoCarroussel,
    );
  }
}
