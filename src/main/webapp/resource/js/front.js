/**
 * 前台脚本JS
 */

var interval = 1000;
$(function() {
	//促销活动，时间倒计时
    function activityTimerDown() {
        $("div[timer=activityEndDateTime]").each(function() {
        	timerDown(this);
        });
    }
    
    //时间倒计时
    function timerDown(obj) {
        var ccc = $(obj);
        //console.log("endDateTime=" + ccc.attr("activityEndDateTime"));
        var now = new Date();
        var endDate = new Date(ccc.attr("activityEndDateTime")); //year, month - 1, day, 14, 07); 
        var leftTime = endDate.getTime() - now.getTime();
        var leftsecond = parseInt(leftTime / 1000);
        var day1 = Math.floor(leftsecond / (60 * 60 * 24));
        var hour1 = Math.floor((leftsecond - day1 * 24 * 60 * 60) / 3600);
        var hour = Math.floor((leftsecond - 60 * 60) / 3600);
        //	var days = Math.floor((leftsecond - ) / 24);
        //如果小时为负数 显示0 
        if (hour > 0) {} else {
            hour = 0;
        }
        if (day1 < 0) {
            hour = hour1
        }
        var minute = Math.floor((leftsecond - day1 * 24 * 60 * 60 - hour1 * 3600) / 60);
        var second = Math.floor(leftsecond - day1 * 24 * 60 * 60 - hour1 * 3600 - minute * 60);
        //如果结束时间为负数 就显示0 
        if (leftTime > 0) {
            ccc.html(day1 + "天" + hour1 + "小时" + minute + "分" + second + "秒");
            //如果显示年份 取消注释 
            //cc.innerHTML = "距离" + year + "年" + month + "月" + day + "日还有：" + hour + "小时" + minute + "分" + second + "秒"; 
        } else {
            ccc.html(0 + "小时" + 0 + "分" + 0 + "秒");
        }
    }
    //showData是DIV的ID 2010，8，10表示是年月日的意思 参数根据自己的需求设置。 
    window.setInterval(function() {
    	activityTimerDown();
    },
    interval);
});
