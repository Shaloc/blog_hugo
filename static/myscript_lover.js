time_is_widget.init({Los_Angeles_z14e:{template:"TIME<br>DATE<br>SUN", date_format:"year年monthnamednum日dayname，第week周", sun_format:"日出: srhour:srminute 日落: sshour:ssminute<br>昼长: dlhours时 dlminutes分", coords:"34.0522300,-118.2436800"}});

function dateCount(){
    var date = new Date();
    var until = new Date('2019-06-25 00:00:00');
    var days = (until - date)/1000/3600/24; 
    // 下面都是简单的数学计算 
    var day = Math.floor(days);
    var hours = (days - day)*24;
    var hour = Math.floor(hours);
    var minutes = (hours - hour)*60;
    var minute = Math.floor(minutes);
    var seconds = (minutes - minute)*60;
    var second = Math.floor(seconds);
    var back = day+'天'+hour+'小时'+minute+'分钟'+second+'秒';
    return back;}
setInterval(function() {
    var text = dateCount();
    // show是一个节点
    last_date_time.innerText = text;
},1000)