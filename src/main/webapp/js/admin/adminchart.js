/**
 * line chart
 *  days : 차트에 들어갈 날짜
 *  salesData : 각 날짜별 매출
 * 
 * pie chart
 *  labels : 범례들
 *  salesData : 각 상품별 매출
 */


const printlineChart = (target, days, salesData, rgb = "#0C7475") => {
  const context = target.getContext("2d");

  const lineChart = new Chart(context, {
      type: 'line',
      data: { // 차트에 들어갈 데이터
          labels: days,
          datasets: [
              { // 데이터(계열당 중괄호 하나)
                  label: '일매출',
                  lineTension: 0,
                  backgroundColor: 'rgba(255,255,255,0)',
                  borderColor: rgb,
                  borderWidth: 2,
                  data: salesData
              }

          ]
      },
      options: {
          maintainAspectRatio: false,
          legend: {
              display: false
          },
          scales: {
              yAxes: [{
                  beginAtZero: true,
                  ticks: {
                    userCallback: function(value, index, values) {
                        value = value.toString();
                        value = value.split(/(?=(?:...)*$)/);
                        value = value.join(',');
                        return value;
                    }
                  }
              }]
          }
      }
  })
};

const printPieChart = (target, labels, salesData, rgb = ["#089C4B", "#9C4917", "#10999C", "#169C00", "#9C1775"]) => {
  const context = target.getContext("2d");
  window.pieChart = new Chart(context, {
      type: 'pie',
      data: {
          labels: labels,
          datasets: [{
              data: salesData,
              backgroundColor: rgb
          }]
      },
      options: {
          maintainAspectRatio: false,
          legend: {
              display: false
          },
          legendCallback: customLegend
      }
  });
  
};

let customLegend = (chart) => {
  let ul = document.createElement('ul');
  let color = chart.data.datasets[0].backgroundColor;

  if(chart.data.label[0] != null) {
      chart.data.labels.forEach(function (label, index) {
          ul.innerHTML += `<li>
                  <span style="background-color: ${color[index]}"></span>
                  <span class="span-customlabel-pie">${label}</span>
              </li>`;
      });
  }

  return ul.outerHTML;
};


const printBarChart = (target, days, memberData, rgb = "#0C7475") => {
  	const context = target.getContext("2d");
  	const max = Math.max(...memberData);
	const plugin = {
	  id: 'custom_canvas_background_color',
	  beforeDraw: (chart) => {
	      const ctx = chart.canvas.getContext('2d');
	      ctx.save();
	      ctx.globalCompositeOperation = 'destination-over';
	      ctx.fillStyle = '#fff';
	      ctx.fillRect(0, 0, chart.width, chart.height);
	      ctx.restore();
	  }
	};

  	const barChart = new Chart(context, {
      	type: 'bar',
      	data: { // 차트에 들어갈 데이터
          	labels: days,
          	datasets: [
              	{ // 데이터(계열당 중괄호 하나)
                  	label: '가입자',
                  	lineTension: 0,
	                  backgroundColor: rgb,
    	              borderColor: 'rgba(255,255,255,0)',
        	          borderWidth: 2,
            	      data: memberData
              	}
          	]
      	},
      	plugins: [plugin],
	      options: {
    	      maintainAspectRatio: false,
        	  legend: {
            	  display: false
          	},
          	scales: {
            	  yAxes: [{
                	  ticks: { suggestedMax: max+1 }
             	 }]
          	}
      	}
  	})
};



const recent7Days = () => {
    const days = new Array();

    const day = new Date();
    days.push(formattedDate(day));
    for(let i = 0; i < 6 ; i++) {
        days.push(formattedDate(new Date(day.setDate(day.getDate() - 1))));
    }

    days.forEach((day, index) => {
        days[index] = day.replaceAll(". ", "-").replace(".","");
    });

    return days.reverse();
};

const formattedDate = (date) => {
	const f = function(n) {
        return n < 10 ? "0"+n : n;
    }
	const yyyy = date.getFullYear();
    const MM = f(date.getMonth() + 1);
    const dd = f(date.getDate());
    
   	return `${yyyy}-${MM}-${dd}`;
};