/**
 * 
 */

	function categoryListRadio(areaId, selectedVal) {
		$.ajax({
			url : "../categoryAjax/selectAll.do?group=1",
			type : "json",
			success : function(data) {
				var options = "";
				for (i = 0; i < data.length; i++) {
					options += '<span><input type="radio" name="categorynum" value="' + data[i].categorynum + '"> ' + data[i].categoryname + '</span>';
				}
				$("#"+areaId).append(options);
				$("input[name='categorynum']:input[value='"+selectedVal+"']").attr("checked","checked");
			}
		});	
	}
	
	function placeLike(){		
		var placenum = $(this).attr('placenum');
		var likeplacenum = $(this).attr('likeplacenum');
		var thisSave = $(this);			
		$.ajax("../likeplaceAjax/insert.do",{
			method: 'post',
			data: { placenum: placenum, likeplacenum: likeplacenum },
			dataType:'json',
			success : function(data, status){
				if(status=="success") {
					thisSave.attr('likeplacenum',data.likeplacenum);	
					if(data.likeplacenum == null || data.likeplacenum == "") {
						thisSave.text("♡");
						$("#likeCnt"+placenum).text(parseInt($("#likeCnt"+placenum).text())-1)
					} else {
						thisSave.text("♥");
						$("#likeCnt"+placenum).text(parseInt($("#likeCnt"+placenum).text())+1)
					}
				} else {
					alert(status);	
				}	
			}				
		});
	}
	
	function dolist(page){
		document.frm.elements["page"].value = page
		document.frm.submit();
	}
	
	var dialogPlace;
	$(function() {
		dialogPlace = $("#dialog-place").dialog({
			autoOpen : false,
			modal : true
		});
	});
	
	function modal_iframe(url, mTitle, mWidth, mHeight) {
		$("#dialog-place").html("");
		$("#dialog-place").append("<iframe src='" + url + "' width='100%' height='98%' frameborder='0' scrolling='no'></iframe>");
		dialogPlace.dialog({title:mTitle,width:mWidth,height:mHeight});
		dialogPlace.dialog("open");
	}