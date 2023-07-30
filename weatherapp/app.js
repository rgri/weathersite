var weatherApp = angular.module('weatherApp', ['chart.js']);

weatherApp.controller("WeatherAppController", function WeatherAppController($scope) {
  $scope.ylabel = "Temperature";
  $scope.xlabel = "Day #"
  $scope.xlabellist = [];
  $scope.data = [];
  for (let i = 0; i < 20; i++) {
    $scope.xlabellist.concat([i + 1])
    $scope.data.concat([Math.floor(10 * Math.random())])
  }
  $scope.lineOptions = {
    scales: {
      yAxes: [
        {
          type: 'linear',
          display: true,
          position: 'left'
        },
      ]
    }
  }
});
