# window.draw_graph = ->
#     ctx = document.getElementById("RaderChart").getContext('2d')
#     RaderChart = new Chart(ctx, {
#         type: 'rader',
#         data: {
#             labels: ["英語", "数学", "国語", "理科", "社会"],
#             datasets: [{
#                 label: 'Aさん',
#                 data: [92, 72, 86, 74, 86],
#                 backgroundColor: 'RGBA(225,95,150, 0.5)',
#                 borderColor: 'RGBA(225,95,150, 1)',
#                 borderWidth: 1,
#                 pointBackgroundColor: 'RGB(46,106,177)'
#             }, {
#                 label: 'Bさん',
#                 data: [73, 95, 80, 87, 79],
#                 backgroundColor: 'RGBA(115,255,25, 0.5)',
#                 borderColor: 'RGBA(115,255,25, 1)',
#                 borderWidth: 1,
#                 pointBackgroundColor: 'RGB(46,106,177)'
#             }]
#         },
#         options: {
#             title: {
#                 display: true,
#                 text: '試験成績'
#             },
#             scale:{
#                 ticks:{
#                     suggestedMin: 0,
#                     suggestedMax: 100,
#                     stepSize: 10,
#                     callback: function(value, index, values){
#                         return  value +  '点'
#                     }
#                 }
#             }
#         }
#     })
