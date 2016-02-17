var ctrl = angular.module("MainControllerModule",[]);

ctrl.controller('ScoresController', ['$scope', 'ScoresApi',
  function($scope, ScoresApi){

    $scope.heading = "What's the score?";

    $scope.scores = [];
    $scope.page = 0;
    $scope.limit = 10;

    $scope.loadMore = function(){
      ScoresApi.getAll($scope.page, $scope.limit).then(function(response){
        $scope.scores = $scope.scores.concat(response.data.scores);
        $scope.page += 1;
      });
    };

    $scope.sendSearch = function(){
      $scope.loading = true;
      ScoresApi.search( $scope.search_term ).then(function(response){
        $scope.scores = response.data.scores;
        $scope.loading = false;
      });
    };

  }
]);
// def index
//
//   limit = (params[:limit] || 10).to_i
//
//   if params[:search]
//     search_term = params[:search]
//     scores = Score.where("description ILIKE ?", "%#{search_term}%")
//                           .limit(limit)
//   else
//     page = (params[:page] || 0).to_i
//     scores = Score.offset(limit*page).limit(limit)
//   end
//
//   render json: {scores: scores}
// end
//
// end
