 $(document).ready(function() {
 
 'use strict'; 

           Morris.Area({
            element: 'hero-area',
            data: [{
                period: '2015',
                iphone: 2250
            }, {
                period: '2016',
                iphone: 4550
            }, {
                period: '2017',
                iphone: 7750
            }, {
                period: '2018',
                iphone: 5750
            }, {
                period: '2019',
                iphone: 10000
            }, {
                period: '2020',
                iphone: 9000
            }, {
                period: '2021',
                iphone: 8000
            }, {
                period: '2022',
                iphone: 7000
            }],
            xkey: 'period',
            ykeys: ['iphone'],
            labels: ['iPhone'],
            hideHover: 'auto',
            lineWidth: 2,
            pointSize: 10,
            lineColors: ['#72d0eb'],
           
            fillOpacity: 1.0,
            smooth: true
		//pointFillColors: ['#00ff00']
        });
      });