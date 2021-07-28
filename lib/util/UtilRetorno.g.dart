// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UtilRetorno.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UtilRetornoUsuario _$UtilRetornoUsuarioFromJson(Map<String, dynamic> json) {
  return UtilRetornoUsuario(
    sucesso: json['sucesso'] == null
        ? null
        : Usuario.fromJson(json['sucesso'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UtilRetornoUsuarioToJson(UtilRetornoUsuario instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };

UtilRetornoPublicacoes _$UtilRetornoPublicacoesFromJson(
    Map<String, dynamic> json) {
  return UtilRetornoPublicacoes(
    sucesso: (json['sucesso'] as List)
        ?.map((e) =>
            e == null ? null : Postagem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UtilRetornoPublicacoesToJson(
        UtilRetornoPublicacoes instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };

UtilRetornoPostagem _$UtilRetornoPostagemFromJson(Map<String, dynamic> json) {
  return UtilRetornoPostagem(
    sucesso: json['sucesso'] == null
        ? null
        : Postagem.fromJson(json['sucesso'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UtilRetornoPostagemToJson(
        UtilRetornoPostagem instance) =>
    <String, dynamic>{
      'sucesso': instance.sucesso,
    };
