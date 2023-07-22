import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../model/movies_model.dart';
import '../res/app_url.dart';

class HomeRepository {

  BaseApiServices _apiServices = NetworkApiServices();

  Future<MovieListModel> fetchMoviesList() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}