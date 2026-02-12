// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_details_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostDetailsModelAdapter extends TypeAdapter<PostDetailsModel> {
  @override
  final int typeId = 12;

  @override
  PostDetailsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PostDetailsModel(
      post: fields[0] as PostModel,
      comments: (fields[1] as List).cast<CommentModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, PostDetailsModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.post)
      ..writeByte(1)
      ..write(obj.comments);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostDetailsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CommentModelAdapter extends TypeAdapter<CommentModel> {
  @override
  final int typeId = 13;

  @override
  CommentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CommentModel(
      id: fields[0] as String,
      content: fields[1] as String,
      authorName: fields[2] as String,
      postId: fields[3] as String,
      likes: (fields[4] as List).cast<String>(),
      dislikes: (fields[5] as List).cast<String>(),
      createdAt: fields[6] as DateTime,
      updatedAt: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, CommentModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.authorName)
      ..writeByte(3)
      ..write(obj.postId)
      ..writeByte(4)
      ..write(obj.likes)
      ..writeByte(5)
      ..write(obj.dislikes)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
