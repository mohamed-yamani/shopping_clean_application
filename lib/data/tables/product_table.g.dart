// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_table.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductTableAdapter extends TypeAdapter<ProductTable> {
  @override
  final int typeId = 0;

  @override
  ProductTable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductTable(
      id: fields[0] as int,
      nom: fields[1] as String?,
      photoPrincipal: fields[2] as String?,
      prix: fields[3] as double?,
      favoris: fields[4] as bool?,
      longeurParLargeur: fields[5] as double?,
      nombrePhotoCarroussel: fields[6] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductTable obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nom)
      ..writeByte(2)
      ..write(obj.photoPrincipal)
      ..writeByte(3)
      ..write(obj.prix)
      ..writeByte(4)
      ..write(obj.favoris)
      ..writeByte(5)
      ..write(obj.longeurParLargeur)
      ..writeByte(6)
      ..write(obj.nombrePhotoCarroussel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductTableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
