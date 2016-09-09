var Parameters = function () {
};
Parameters.prototype.setP1 = function (id) {
	this.p1 = id;
};
Parameters.prototype.getP1 = function () {
	return this.p1;
};
Parameters.prototype.setP2 = function (id) {
	this.p2 = id;
};
Parameters.prototype.getP2 = function () {
	return this.p2;
};
Parameters.prototype.setP3 = function (id) {
	this.p3 = id;
};
Parameters.prototype.getP3 = function () {
	return this.p3;
};
Parameters.prototype.setP4 = function (id) {
	this.p4 = id;
};
Parameters.prototype.getP4 = function () {
	return this.p4;
};
Parameters.prototype.setP5 = function (id) {
	this.p5 = id;
};
Parameters.prototype.getP5 = function () {
	return this.p5;
};
Parameters.prototype.setP6 = function (id) {
	this.p6 = id;
};
Parameters.prototype.getP6 = function () {
	return this.p6;
};
Parameters.prototype.setP7 = function (id) {
	this.p7 = id;
};
Parameters.prototype.getP7 = function () {
	return this.p7;
};
Parameters.prototype.setP8 = function (id) {
	this.p8 = id;
};
Parameters.prototype.getP8 = function () {
	return this.p8;
};
Parameters.prototype.setP9 = function (id) {
	this.p9 = id;
};
Parameters.prototype.getP9 = function () {
	return this.p9;
};
Parameters.prototype.setP10 = function (id) {
	this.p10 = id;
};
Parameters.prototype.getP10 = function () {
	return this.p10;
};
Parameters.prototype.setP11 = function (id) {
	this.p11 = id;
};
Parameters.prototype.getP11 = function () {
	return this.p11;
};
Parameters.prototype.setP12 = function (id) {
	this.p12 = id;
};
Parameters.prototype.getP12 = function () {
	return this.p12;
};
Parameters.prototype.setP13 = function (id) {
	this.p13 = id;
};
Parameters.prototype.getP13 = function () {
	return this.p13;
};
Parameters.prototype.setP14 = function (id) {
	this.p14 = id;
};
Parameters.prototype.getP14 = function () {
	return this.p14;
};

String.prototype.Trim = function()
	{
	    return this.replace(/(^\s*)|(\s*$)/g, "");
	};

String.prototype.StartsWith = function(str) 
{
    return this.substr(0, str.length) == str;
};

/**
* inter day between two days
*/
function DateDiff(sDate1, sDate2){ //sDate1和sDate2是2002-12-18格式 
		var aDate, oDate1, oDate2, iDays 
		aDate = sDate1.split("-") 
		oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]) //转换为12-18-2002格式 
		aDate = sDate2.split("-") 
		oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]) 
		iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 /24) //把相差的毫秒数转换为天数 
		//alert(iDays);
		return iDays; 
} 