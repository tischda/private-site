/* $Id: date.js 67 2007-03-17 22:40:36Z dtischer $ */

function getDay(nDay)
{
	var days = new Array("Sunday","Monday","Tuesday","Wednesday",
                     "Thursday","Friday","Saturday");
	return days[nDay]
}

function getMonth(nMonth)
{
	var months = new Array("January","February","March","April","May","June",
                       "July","August","September","October","November","December");
	return months[nMonth]
}

function getYear(nYear)
{
	if (nYear < 1900) {
		nYear += 1900;
	}
	return nYear;
}

function dateString()
{
	var Today = new Date();
	var suffix = "th";
	switch (Today.getDate())
	{
		case 1:
		case 21:
		case 31:
		suffix = "st"; break;
		case 2:
		case 22:
		suffix = "nd"; break;
		case 3:
		case 23:
		suffix = "rd"; break;
	};
	var strDate = getDay(Today.getDay()) + " " + Today.getDate();
	strDate += suffix + " " + getMonth(Today.getMonth()) + " " + getYear(Today.getYear());
	return strDate;
}
