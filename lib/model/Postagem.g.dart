// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Postagem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Postagem _$PostagemFromJson(Map<String, dynamic> json) {
  return Postagem(
    conteudo: json['conteudo'] as String,
    criador: json['criador'] == null
        ? null
        : Usuario.fromJson(json['criador'] as Map<String, dynamic>),
    dataDePostagem:
        UtilDataHora.convertStringToDate(json['dataDePostagem'] as String),
    id: json['id'] as String,
  )..likes = (json['likes'] as List)
      ?.map(
          (e) => e == null ? null : Usuario.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$PostagemToJson(Postagem instance) => <String, dynamic>{
      'id': instance.id,
      'conteudo': instance.conteudo,
      'dataDePostagem': instance.dataDePostagem?.toIso8601String(),
      'criador': instance.criador,
      'likes': instance.likes,
    };

Comentario _$ComentarioFromJson(Map<String, dynamic> json) {
  return Comentario(
    comentario: json['comentario'] as String,
    criador: json['criador'] == null
        ? null
        : Usuario.fromJson(json['criador'] as Map<String, dynamic>),
    dataDoComentario:
        UtilDataHora.convertStringToDate(json['dataDoComentario'] as String),
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$ComentarioToJson(Comentario instance) =>
    <String, dynamic>{
      'comentario': instance.comentario,
      'id': instance.id,
      'dataDoComentario': instance.dataDoComentario?.toIso8601String(),
      'criador': instance.criador,
    };
