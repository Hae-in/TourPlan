/*jslint white: true, browser: true, undef: true, nomen: true, eqeqeq: true, plusplus: false, bitwise: true, regexp: true, strict: true, newcap: true, immed: true, maxerr: 14 */
/*global window: false, REDIPS: true */

/* enable strict mode */
"use strict";


// create redips container
var redips = {};


// redips initialization
redips.init = function () {
	// reference to the REDIPS.drag object
	var	rd = REDIPS.drag;
	// initialization
	rd.init();
	// REDIPS.drag settings
	rd.dropMode = 'single';			// dragged elements can be placed only to the empty cells
	rd.hover.colorTd = '#9BB3DA';	// set hover color
	rd.clone.keyDiv = true;			// enable cloning DIV elements with pressed SHIFT key
	// prepare node list of DIV elements in table2
	redips.divNodeList = document.getElementById('table2').getElementsByTagName('div');
	
	rd.event.dropped = function () {
		if(rd.objOld.className.indexOf('redips-clone') > -1) { }
		else {
		var tr = rd.td.target.getAttribute("id");
		var x_tr = rd.td.source.getAttribute("id");
		console.log("tr : #post" + tr + " 과 x_tr : #post" + x_tr);
		
		var arr = new Array();
		arr = tr.split("a");
		
		var child1 = rd.objOld.childNodes[0].nodeValue;
		var child2 = rd.objOld.childNodes[2].nodeValue;
		
		//append를 하면 eq가 바뀐다!!
		var n = $("#post"+x_tr+">*").length;
		for(i=0; i<n; i++) {
			console.log(i+"번째 자식 옮기는중");
			console.log($("#post"+x_tr+">*:eq(0)"));
			var child = $("#post"+x_tr+">*:eq(0)");
			$("#post"+tr).append(child);
		}
		$("#post"+tr+"+button").css("display", "block");
		$("#post"+x_tr+"+button").css("display", "none");
		}
	};

	rd.event.clonedDropped = function() {
		rd.obj.lastChild.setAttribute("type", "text");
		
		var tr = rd.td.target.getAttribute("id");
		var arr = new Array();
		arr = tr.split("a");
		
		var child1 = rd.objOld.childNodes[0].nodeValue;
		var child2 = rd.objOld.childNodes[2].nodeValue;
		
		$("#post"+tr).append("<div class='post_loc'>" + child1 + "<br>" + child2 + "</div>");
		$("#post"+tr+"+button").css("display", "block");
	}
	
	// after element is deleted from the timetable, print message
	rd.event.deleted = function () {
		var x_tr = rd.td.previous.getAttribute("id");
		
		$("#post"+x_tr).empty();
		$("#post"+x_tr+"+button").hide();
	};
	
	// if any element is clicked, then make all subjects in timetable visible
	rd.event.clicked = function () {
		redips.showAll();
	};
	
	//안됨
	rd.event.dblClicked = function(objOld) {
		rd.deleteObject(objOld);
	}
};


// function show all subjects in timetable
redips.showAll = function () {
	var	i; // loop variable
	for (i = 0; i < redips.divNodeList.length; i++) {
		redips.divNodeList[i].style.visibility = 'visible';
	}
};


// add onload event listener
if (window.addEventListener) {
	window.addEventListener('load', redips.init, false);
}
else if (window.attachEvent) {
	window.attachEvent('onload', redips.init);
}