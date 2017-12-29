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
	rd.animation.step = 8;
	rd.dropMode = 'single';			// dragged elements can be placed only to the empty cells
	rd.hover.colorTd = '#9BB3DA';	// set hover color
	rd.clone.keyDiv = true;			// enable cloning DIV elements with pressed SHIFT key
	// prepare node list of DIV elements in table2
	redips.divNodeList = document.getElementById('table2').getElementsByTagName('div');
	// element is dropped
	
	rd.event.dropped = function () {
			//targetRow = targetCell.parentNode,	// target row
			//i, objNew;							// local variables
		if(rd.objOld.className.indexOf('redips-clone') > -1) { console.log("복제된"); }
		else {
			var arr = new Array();
			var arr2 = new Array();
			var tr = rd.td.target.getAttribute("id");
			var x_tr = rd.td.source.getAttribute("id");
			
			var child1 = rd.objOld.childNodes[0].nodeValue;
			var child2 = rd.objOld.childNodes[2].nodeValue;
			arr2 = rd.objOld.getAttribute("id").split("_");
			var placenum = arr2[1];
			
			send("update", tr, "", placenum, child1, child2, x_tr);
			
		}
	};
	
	rd.event.clonedDropped = function() {
		var arr = new Array();
		var arr2 = new Array();
		var tr = rd.td.target.getAttribute("id");
		
		var child1 = rd.objOld.childNodes[0].nodeValue;
		var child2 = rd.objOld.childNodes[2].nodeValue;
		arr2 = rd.objOld.getAttribute("id").split("_");
		var placenum = arr2[1];
		
		send("insert", tr, "", placenum, child1, child2, "");
	}
	
	// after element is deleted from the timetable, print message 
	rd.event.deleted = function () {
		if(rd.objOld.className.indexOf('redips-clone') > -1) { console.log("복제된"); }
		else {
			var rmid = rd.obj.getAttribute("id");
			
			send("delete", rmid, "", "", "", "", "");
		}
	};
	
	// if any element is clicked, then make all subjects in timetable visible
	rd.event.clicked = function () {
		redips.showAll();
	};
};


// save elements and their positions
redips.save = function () {
	// scan timetable content
	var content = REDIPS.drag.saveContent('table2');
	// and save content
	window.location.href = 'db_save.php?' + content;
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