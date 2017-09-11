$.fn.selectDate = function(){
			var minYear = 1900
			var maxYear = (new Date).getFullYear()
			var yearSel = document.getElementById('year')
			var monthSel = document.getElementById('month')
			var daySel = document.getElementById('days')
	
			for(var y = maxYear;y >= minYear;y--){
				var yearOpt = document.createElement('option')
				yearOpt.value = y
				yearOpt.innerHTML = y+'年'
				yearSel.appendChild(yearOpt)
			}

			$("#year").focus(function(event){
				removeOption(monthSel)
				addOption(12,'月',monthSel)
				removeOption(daySel)
			})

			$("#month").click(function(){
				removeOption(daySel)
				var year = $("#year option:selected").val()
				var month = $("#month option:selected").val()
				if(month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12){
					addOption(31,'日',daySel)
				}else if(month==4 || month==6 || month==9 || month==11){
					addOption(30,'日',daySel)
				}else if(month==2){
					if((year%4 == 0 && year%100 != 0 ) || (year%400 == 0)){
						addOption(29,'日',daySel)
					}else{	
						addOption(28,'日',daySel)
					}
				}
			})

			function addOption(num,unit,parent){
				//parent：父对象
				//unit：单位（年/月/日）
				 //num：选项个数
				for(var index=1;index <= num;index++){
					var opt =document.createElement('option')
					$(opt).attr('value',index)
					if(index<10){index = '0'+index}
					$(opt).html(index+unit)
					$(parent).append(opt)
				}
			}
			
			function removeOption(parent){
				//parent：父对象
				var options = $(parent).find('option')
				for(var index = 1;index < options.length;index++){
					parent.removeChild(options[index])
				}
			}
		}