// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ServicosDoMicroBlog.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ServicosDoMicroBlog implements ServicosDoMicroBlog {
  _ServicosDoMicroBlog(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://us-central1-meu-blog-curso.cloudfunctions.net';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<UtilRetornoUsuario> cadastrarUsuario(usuario) async {
    ArgumentError.checkNotNull(usuario, 'usuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(usuario?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/usuario/cadastrarUsuario',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoUsuario.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoUsuario> editarUsuario(usuario) async {
    ArgumentError.checkNotNull(usuario, 'usuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(usuario?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/usuario/editarUsuarioUsuario',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoUsuario.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoUsuario> logarUsuario(email, senha) async {
    ArgumentError.checkNotNull(email, 'email');
    ArgumentError.checkNotNull(senha, 'senha');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'email': email, r'senha': senha};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/usuario/logarUsuario',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoUsuario.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoPublicacoes> consultarPublicacoes() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/feed/consultarPublicacoes',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoPublicacoes.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoPostagem> removerLike(idPostagem, idUsuario) async {
    ArgumentError.checkNotNull(idPostagem, 'idPostagem');
    ArgumentError.checkNotNull(idUsuario, 'idUsuario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': idPostagem,
      r'idUsuario': idUsuario
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/feed/removerLike',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoPostagem.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoPostagem> darLike(usuario, idPostagem) async {
    ArgumentError.checkNotNull(usuario, 'usuario');
    ArgumentError.checkNotNull(idPostagem, 'idPostagem');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': idPostagem};
    final _data = <String, dynamic>{};
    _data.addAll(usuario?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>('/feed/darLike',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoPostagem.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoPostagem> removerComentario(
      idPostagem, idComentario) async {
    ArgumentError.checkNotNull(idPostagem, 'idPostagem');
    ArgumentError.checkNotNull(idComentario, 'idComentario');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'id': idPostagem,
      r'idComentario': idComentario
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/feed/excluirComentario',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoPostagem.fromJson(_result.data);
    return value;
  }

  @override
  Future<UtilRetornoPostagem> comentarPublicacao(comentario, idPostagem) async {
    ArgumentError.checkNotNull(comentario, 'comentario');
    ArgumentError.checkNotNull(idPostagem, 'idPostagem');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': idPostagem};
    final _data = <String, dynamic>{};
    _data.addAll(comentario?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/feed/comentarPost',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoPostagem.fromJson(_result.data);
    return value;
  }

  @override
  Future<String> excluirPostagem(idPostagem) async {
    ArgumentError.checkNotNull(idPostagem, 'idPostagem');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'id': idPostagem};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<String>('/feed/excluirPostagem',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'DELETE',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<UtilRetornoPostagem> manterPublicacao(postagem) async {
    ArgumentError.checkNotNull(postagem, 'postagem');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(postagem?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.request<Map<String, dynamic>>(
        '/feed/manterPublicacao',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UtilRetornoPostagem.fromJson(_result.data);
    return value;
  }
}
