import 'package:microblog/model/Postagem.dart';
import 'package:microblog/model/Usuario.dart';
import 'package:microblog/util/UtilRetorno.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'ServicosDoMicroBlog.g.dart';

@RestApi(baseUrl: "https://us-central1-meu-blog-curso.cloudfunctions.net")
abstract class ServicosDoMicroBlog {
  factory ServicosDoMicroBlog(Dio dio, {String baseUrl}) = _ServicosDoMicroBlog;

  @POST("/usuarioLaiz/cadastrarUsuario")
  Future<UtilRetornoUsuario> cadastrarUsuario(@Body() Usuario usuario);

  @PUT("/usuarioLaiz/editarUsuarioUsuario")
  Future<UtilRetornoUsuario> editarUsuario(@Body() Usuario usuario);

  @GET("/usuarioLaiz/logarUsuario")
  Future<UtilRetornoUsuario> logarUsuario(
      @Query("email") String email, @Query("senha") String senha);

  @GET("/feedLaiz/consultarPublicacoes")
  Future<UtilRetornoPublicacoes> consultarPublicacoes();

  @DELETE("/feedLaiz/removerLike")
  Future<UtilRetornoPostagem> removerLike(
      @Query("id") String idPostagem, @Query("idUsuario") String idUsuario);

  @POST("/feedLaiz/darLike")
  Future<UtilRetornoPostagem> darLike(
      @Body() Usuario usuario, @Query("id") String idPostagem);

  @DELETE("/feedLaiz/excluirComentario")
  Future<UtilRetornoPostagem> removerComentario(@Query("id") String idPostagem,
      @Query("idComentario") String idComentario);

  @POST("/feedLaiz/comentarPost")
  Future<UtilRetornoPostagem> comentarPublicacao(@Body() Comentario comentario, @Query("id") String idPostagem);

  @DELETE("/feedLaiz/excluirPostagem")
  Future<String> excluirPostagem(@Query("id") String idPostagem);

  @POST("/feedLaiz/manterPostagem")
  Future<UtilRetornoPostagem> manterPublicacao(@Body() Postagem postagem);
}
