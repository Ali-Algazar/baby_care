// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostModelAdapter extends TypeAdapter<PostModel> {
  @override
  final int typeId = 11;

  @override
  PostModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostModel(
      id: fields[0] as String,
      title: fields[1] as String,
      content: fields[2] as String,
      authorName: fields[3] as String,
      views: fields[4] as int,
      commentCount: fields[5] as int,
      likes: (fields[6] as List).cast<String>(),
      saves: (fields[7] as List).cast<String>(),
      isLiked: fields[8] as bool,
      isSaved: fields[9] as bool,
      isDisliked: fields[10] as bool,
      createdAt: fields[11] as DateTime,
      updatedAt: fields[12] as DateTime,
      imageUrl: fields[13] as String?,
      dislikes: (fields[14] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PostModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.authorName)
      ..writeByte(4)
      ..write(obj.views)
      ..writeByte(5)
      ..write(obj.commentCount)
      ..writeByte(6)
      ..write(obj.likes)
      ..writeByte(7)
      ..write(obj.saves)
      ..writeByte(8)
      ..write(obj.isLiked)
      ..writeByte(9)
      ..write(obj.isSaved)
      ..writeByte(10)
      ..write(obj.isDisliked)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt)
      ..writeByte(13)
      ..write(obj.imageUrl)
      ..writeByte(14)
      ..write(obj.dislikes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
