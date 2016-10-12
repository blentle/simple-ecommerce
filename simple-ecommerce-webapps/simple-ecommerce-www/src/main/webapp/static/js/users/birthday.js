/**
 * @see birthday
 */
var nowdate = new Date(); // 获取当前时间的年份
var nowYear = nowdate.getFullYear();// 当前年份
var nowMonth = nowdate.getMonth() + 1;// 当前月份
// 清空年份、月份的下拉框 进行重新添加选项
$("#birthdayYear").empty();
$("#birthdayMonth").empty();
$("#birthdayYear").append(
		"<option value='0' disabled='' selected='selected'>请选择：</option>");
$("#birthdayMonth").append(
		"<option value='0' disabled='' selected='selected'>请选择：</option>");
$("#birthdayDay").append(
		"<option value='0' disabled='' selected='selected'>请选择：</option>");
for (var startYear = nowYear; startYear >= 1930; startYear--) {
	var year;
	if ((startYear + 11) % 10 == 0) { // 模糊年份
		year = (startYear - 9 + "").substring(2);
		$("<option value='" + year + "后'>" + year + "后</option>").appendTo(
				"#birthdayYear");
	}
	$("<option value='" + startYear + "'>" + startYear + "</option>").appendTo(
			"#birthdayYear");
}

for (var startMonth = 1; startMonth <= 12; startMonth++) {
	$("<option value='" + startMonth + "'>" + startMonth + "</option>")
			.appendTo("#birthdayMonth");
}

if (initBirthdayYear == null || initBirthdayYear == ""
		|| initBirthdayYear == "1") {
	$("#birthdayYear").val(0);
	$("#birthdayMonth").val(0);
	$("#birthdayDay").val(0);
} else {
	$("#birthdayYear").val(initBirthdayYear);
	$("#birthdayMonth").val(initBirthdayMonth);
	elementOnchangeEvent();
}

// 选择生日年份后触发
$("#birthdayYear").change(function() {
	elementOnchangeEvent();
});

// 选择生日月份后触发
$("#birthdayMonth").change(function() {
	elementOnchangeEvent();
});

// 根据所选择的年份、月份计算月最大天数,并重新填充生日下拉框中的日期项
function elementOnchangeEvent() {

	var maxNum;
	var month = $("#birthdayMonth").val();
	if (month == null)
		month = 0;
	var year = $("#birthdayYear").val();
	if (year == 0) { // 如果年份没有选择，则按照闰年计算日期(借用2004年为闰年)
		year = 2004;
	}
	if (month == 0) {
		maxNum = 31;
	} else if (month == 2) {
		if (year.toString().substring(2) == "后") { // 判断年份是否为模糊年份
													// 如果是模糊年份则天数设为29
			maxNum = 29;
		} else {
			if (year % 400 == 0 || (year % 4 == 0 && year % 100 != 0)) { // 判断闰年
				maxNum = 29;
			} else {
				maxNum = 28;
			}
		}
	} else if (month == 4 || month == 6 || month == 9 || month == 11) {
		maxNum = 30;
	} else {
		maxNum = 31;
	}

	// 清空日期的下拉框 进行重新添加选项
	$("#birthdayDay").empty();
	if (month == 0) {
		$("<option value='0' disabled='' selected='selected'>请选择：</option>")
				.appendTo("#birthdayDay");
	} else {
		for (var startDay = 1; startDay <= maxNum; startDay++) {
			$("<option value='" + startDay + "'>" + startDay + "</option>")
					.appendTo("#birthdayDay");
		}
		if (maxNum >= initBirthdayDay) {
			setTimeout(function() {
				$("#birthdayDay").val(initBirthdayDay);
			}, 1);
		} else {
			setTimeout(function() {
				$("#birthdayDay").val(1);
			}, 1);
			initBirthdayDay = 1;
		}
	}
}