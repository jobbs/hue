var alrmFlag;
function doCheckAlrm(token) {
	try {
		alrmFlag =  $.cookie("alrmFlag");
		if (alrmFlag!=null || alrmFlag == 'false') {
			if(window.console) console.log('alrmFlag: ' + alrmFlag);
			if (typeof _timer != 'undefined') {
				window.clearInterval(_timer);
			}
			return;
		}
		var url = '/emergency/call';
		$.ajax({
			type: "POST",
			url : url,
			data: {'data':{},'csrfmiddlewaretoken': tokens},
			dataType: "json",
			success : function(response) {

				if( result.success ) {

					var cookieTime = $.cookie("alrmCookie");
                    var temp = response.result.sort();
                    temp.sort(function(a, b) {
                                a = new Date(a.callDate);
                                b = new Date(b.callDate);
                                return a>b ? -1 : a<b ? 1 : 0;
                    });
                    temp.sort((a,b) => (a.deviceUuid > b.deviceUuid) ? 1 : ((b.deviceUuid > a.deviceUuid) ? -1 : 0));
                    var periodResultArray = getUniqueObjectArray(temp);
					$(".alrm_dropdown").html("");
					if( periodResultArray != null ) {

						for( var i=0; i < periodResultArray.length; i++ ) {
							alrm = periodResultArray[i];
							if( (cookieTime == undefined || cookieTime < alrm.callDate) && alrm.deviceState == '1') {
								$("#alertsDiv").append(
										'<a href="#" class="alert alert-red" role="alert"><i class="fa fa-volume-up aqua"></i> ' + alrm.deviceUuid + ' 긴급발생</a>'
									);
							}

							if( i == 5 ) break;
						}

					}
				}

				$("#alertsDiv > a").each(function() {
					var $this = $(this);
					$(this).fadeOut(3000, "linear", function() {
						$this.remove();
					});
				});

				$.cookie("alrmCookie", Date.now());
			}
		});

	} catch ( err ) {
		console.log( "Check Alram Error " + err );
	}
}

doCheckAlrm();
var _timer = setInterval(doCheckAlrm, (30*1000));

function getUniqueObjectArray(array) {
  var tempArray = [];
  var resultArray = [];
  for(var i = 0; i < array.length; i++) {
    var item = array[i]
    if(tempArray.includes(item["deviceUuid"])) {
      continue;
    } else {
      resultArray.push(item);
      tempArray.push(item["deviceUuid"]);
    }
  }
  return resultArray;
}