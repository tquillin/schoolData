var api = angular.module('ScoresApiFactory', []);

api.factory('ScoresApi', ['$http', function($http){

  var scoresFactoryInterface = {};
  var baseUrl = '/api/scores/';

  scoresFactoryInterface.getAll = function(page, limit){
    page = page || 0;
    limit = limit || 10;
    var url = baseUrl + "?page=" + page + "&limit=" + limit;
    return $http.get(url);
  };

  scoresFactoryInterface.search = function(search_term){
    var url = baseUrl + "?search=" + search_term + "&limit=1000";
    return $http.get(url);
  };

  return scoresFactoryInterface;

}]);
