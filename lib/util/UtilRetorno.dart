import 'package:json_annotation/json_annotation.dart';
import 'package:microblog/model/Postagem.dart';
import 'package:microblog/model/Usuario.dart';

part 'UtilRetorno.g.dart';

@JsonSerializable()
class UtilRetornoUsuario {
  Usuario sucesso;
  UtilRetornoUsuario({this.sucesso});

  factory UtilRetornoUsuario.fromJson(Map<String, dynamic> json) =>
      _$UtilRetornoUsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$UtilRetornoUsuarioToJson(this);
}

@JsonSerializable()
class UtilRetornoPublicacoes {
  List<Postagem> sucesso;
  UtilRetornoPublicacoes({this.sucesso});

  factory UtilRetornoPublicacoes.fromJson(Map<String, dynamic> json) =>
      _$UtilRetornoPublicacoesFromJson(json);
  Map<String, dynamic> toJson() => _$UtilRetornoPublicacoesToJson(this);
}

@JsonSerializable()
class UtilRetornoPostagem {
  Postagem sucesso;
  UtilRetornoPostagem({this.sucesso});

  factory UtilRetornoPostagem.fromJson(Map<String, dynamic> json) =>
      _$UtilRetornoPostagemFromJson(json);
  Map<String, dynamic> toJson() => _$UtilRetornoPostagemToJson(this);
}
