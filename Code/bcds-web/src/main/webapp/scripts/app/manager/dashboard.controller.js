'use strict';

angular.module('bcdsApp').controller('DashboardController',
	function($scope,$state) {
        $scope.searchTerm = undefined;

	    $scope.claims = [{
            "is_collapsed": false,
            "file_number" : "212029876",
            "name": "John Doe",
            "claim_num": "5614193",
            "claim_date": "03/10/2016",
            "contentions": [{
                "code": 2200,
                "description": "Hearing"
            }, {
                "code": 2210,
                "description": "Ear"
            }]
    },{
            "is_collapsed": true,
            "file_number" : "313029876",
            "name": "Jane Doe",
            "claim_num": "5714193",
            "claim_date": "02/16/2016",
            "contentions": [{
                "code": 5340,
                "description": "Knee"
            }, {
                "code": 9100,
                "description": "Knee"
            }]
    }];
	    $scope.page = 1;

	    $scope.loadPage = function(page) {
		    $scope.page = page;
	    };

        $scope.formatDate = function(date) {
            var date = new Date(date);
            return ('0' + (date.getMonth()+1)).slice(-2) + '/' +
                ('0' + date.getDate()).slice(-2) + '/'
                + date.getFullYear();
        };

        $scope.isCollapsed = function(claim) {
            if (claim.isCollapsed == undefined) {
                claim.isCollapsed = true;
            }
            return claim.isCollapsed;
        };

        $scope.toggleCollapse = function(claim) {
            if (claim.isCollapsed == undefined) {
                claim.isCollapsed = true;
            }
            else {
                claim.isCollapsed = !claim.isCollapsed;
            }
        };

        $scope.displayProcess = function() {
          $('#modelDialog').modal('show');
        };

        $scope.click = function() {
            $('#next').removeClass('hidden');
        }

        $scope.search = function(searchTerm) {
            if(searchTerm == 1234){
                $('#serviceErrorDialog').modal('show');
            }
            else {
                $scope.claims.push({
                    "is_collapsed": false,
                    "file_number": "515049876",
                    "name": "John Smith",
                    "claim_num": "5625193",
                    "claim_date": "01/10/2016",
                    "contentions": [
                        {
                            "code": 5100,
                            "description": "Knee"
                        },
                        {
                            "code": 2100,
                            "description": "Ear"
                        }
                    ]
                });
            }
        }

        $scope.deleteClaim = function(claim) {
            var index = $scope.claims.indexOf(claim);
            $scope.claims.splice(index,1);
        }

        $scope.clear = function(){
            $scope.claims = [];
        }


    });
