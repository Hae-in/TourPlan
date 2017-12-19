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
	// show / hide report buttons (needed for dynamic version - with index.php)
	redips.reportButton();
	// element is dropped
	rd.event.dropped = function () {
		var	objOld = rd.objOld,					// original object
			targetCell = rd.td.target,			// target cell
			targetRow = targetCell.parentNode,	// target row
			i, objNew;							// local variables
		// if checkbox is checked and original element is of clone type then clone spread subjects to the week
		if (document.getElementById('week').checked === true && objOld.className.indexOf('redips-clone') > -1) {
			// loop through table cells
			for (i = 0; i < targetRow.cells.length; i++) {
				// skip cell if cell has some content (first column is not empty because it contains label)
				if (targetRow.cells[i].childNodes.length > 0) {
					continue;
				}
				// clone DIV element
				objNew = rd.cloneObject(objOld);
				// append to the table cell
				targetRow.cells[i].appendChild(objNew);
			}
		}
		// print message only if target and source table cell differ
		if (rd.td.target !== rd.td.source) { 
			redips.printMessage('Content has been changed!');
		}
		// show / hide report buttons
		redips.reportButton();
	};

	// after element is deleted from the timetable, print message
	rd.event.deleted = function () {
		redips.printMessage('Content has been deleted!');
		// show / hide report buttons
		redips.reportButton();
	};
	
	// if any element is clicked, then make all subjects in timetable visible
	rd.event.clicked = function () {
		redips.showAll();
	};
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