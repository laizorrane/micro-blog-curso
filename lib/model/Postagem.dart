import 'package:json_annotation/json_annotation.dart';
import 'package:microblog/model/Usuario.dart';
import 'package:microblog/util/UtilDataHora.dart';
part 'Postagem.g.dart';

@JsonSerializable()
class Postagem {
  String id, conteudo;

  @JsonKey(fromJson: UtilDataHora.convertStringToDate)
  DateTime dataDePostagem;
  Usuario criador;
  List<Usuario> likes;

  Postagem({this.conteudo, this.criador, this.dataDePostagem, this.id});
  factory Postagem.fromJson(Map<String, dynamic> json) =>
      _$PostagemFromJson(json);
  Map<String, dynamic> toJson() => _$PostagemToJson(this);
}

@JsonSerializable()
class Comentario {
  Comentario({this.comentario, this.criador, this.dataDoComentario, this.id});
  String comentario, id;
  @JsonKey(fromJson: UtilDataHora.convertStringToDate)
  DateTime dataDoComentario;
  Usuario criador;

  factory Comentario.fromJson(Map<String, dynamic> json) =>
      _$ComentarioFromJson(json);
  Map<String, dynamic> toJson() => _$ComentarioToJson(this);
}
