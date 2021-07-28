// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ControladorFeed.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ControladorFeed on _ControladorFeed, Store {
  Computed<bool> _$habilitadoAPostarComputed;

  @override
  bool get habilitadoAPostar => (_$habilitadoAPostarComputed ??= Computed<bool>(
          () => super.habilitadoAPostar,
          name: '_ControladorFeed.habilitadoAPostar'))
      .value;

  final _$mPostagensAtom = Atom(name: '_ControladorFeed.mPostagens');

  @override
  ObservableList<Postagem> get mPostagens {
    _$mPostagensAtom.reportRead();
    return super.mPostagens;
  }

  @override
  set mPostagens(ObservableList<Postagem> value) {
    _$mPostagensAtom.reportWrite(value, super.mPostagens, () {
      super.mPostagens = value;
    });
  }

  final _$mStatusConsultaFeedAtom =
      Atom(name: '_ControladorFeed.mStatusConsultaFeed');

  @override
  StatusConsulta get mStatusConsultaFeed {
    _$mStatusConsultaFeedAtom.reportRead();
    return super.mStatusConsultaFeed;
  }

  @override
  set mStatusConsultaFeed(StatusConsulta value) {
    _$mStatusConsultaFeedAtom.reportWrite(value, super.mStatusConsultaFeed, () {
      super.mStatusConsultaFeed = value;
    });
  }

  final _$conteudoPublicacaoAtom =
      Atom(name: '_ControladorFeed.conteudoPublicacao');

  @override
  String get conteudoPublicacao {
    _$conteudoPublicacaoAtom.reportRead();
    return super.conteudoPublicacao;
  }

  @override
  set conteudoPublicacao(String value) {
    _$conteudoPublicacaoAtom.reportWrite(value, super.conteudoPublicacao, () {
      super.conteudoPublicacao = value;
    });
  }

  @override
  String toString() {
    return '''
mPostagens: ${mPostagens},
mStatusConsultaFeed: ${mStatusConsultaFeed},
conteudoPublicacao: ${conteudoPublicacao},
habilitadoAPostar: ${habilitadoAPostar}
    ''';
  }
}
