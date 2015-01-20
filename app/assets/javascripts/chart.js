if (gon.data){
var data = gon.data;
var ctx = $("#myChart").get(0).getContext("2d");
var myBarChart = new Chart(ctx).Bar(data);
}
