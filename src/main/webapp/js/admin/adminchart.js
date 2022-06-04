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

  chart.data.labels.forEach(function (label, index) {
      ul.innerHTML += `<li>
              <span style="background-color: ${color[index]}"></span>
              <span class="span-customlabel-pie">${label}</span>
          </li>`;
  });

  return ul.outerHTML;
};