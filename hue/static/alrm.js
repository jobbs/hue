var alrmFlag;
function doCheckAlrm() {
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
			type: "GET",
			url : url,
			headers: {
			  "X-CSRFToken": tokens
			},
			dataType: "json",
			success : function(response) {
                    response = eval(response);
					var cookieTime = $.cookie("alrmCookie");
					var temp = new Array();
					for(var idx=0; idx <response.length; idx++){
					  temp.push(response[idx].fields);
					}
                    temp = temp.sort();
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
							var dttm = new Date(alrm.callDate).getTime();
							if( (cookieTime == undefined || cookieTime < dttm) && alrm.deviceState == 1) {
								$("#alertsDiv").append(
										'<div style="padding-bottom:50px;"><a href="/emergency/'+alrm.deviceUuid+'" class="alert alert-red" role="alert">*디바이스ID \"' + alrm.deviceUuid + '\" 긴급상황발생</a></div>'
									);
							}

							if( i == 5 ) break;


					}
				}

				$("#alertsDiv > div > a").each(function() {
					var $this = $(this);
					$(this).fadeOut(10000, "linear", function() {
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

if(window.location.pathname != "/" && window.location.pathname != "/login/" ){
doCheckAlrm();
var _timer = setInterval(doCheckAlrm, (3*1000));
}
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