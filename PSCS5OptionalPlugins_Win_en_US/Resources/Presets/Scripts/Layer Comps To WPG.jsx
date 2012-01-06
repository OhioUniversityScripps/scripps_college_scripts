// Copyright 2007.  Adobe Systems, Incorporated.  All rights reserved.
// This script will apply each comp and then export to a file
// Written by Naoki Hada
// ZStrings and auto layout by Tom Ruark
// For CS3 we almost moved Web Photo Gallery to the Bridge application and
// renamed it Adobe Media Gallery (AMG)

/*
@@@BUILDINFO@@@ Layer Comps To WPG.jsx 1.0.0.9
*/

/*

// BEGIN__HARVEST_EXCEPTION_ZSTRING

<javascriptresource>
<name>$$$/JavaScripts/LayerCompsToWPG/Name=Layer Comps to WPG...</name>
<about>$$$/JavaScripts/LayerCompsToWPG/About=Layer Comps to WPG ^r^rCopyright 2008 Adobe Systems Incorporated. All rights reserved.^r^rOutputs the layer comps in the current document to the Web Photo Gallery.</about>
<category>layercomps</category>
<enableinfo>true</enableinfo>
</javascriptresource>

// END__HARVEST_EXCEPTION_ZSTRING

*/

// enable double clicking from the Macintosh Finder or the Windows Explorer
#target photoshop

// debug level: 0-2 (0:disable, 1:break on error, 2:break at beginning)
// $.level = 0;
// debugger; // launch debugger on next line

// on localized builds we pull the $$$/Strings from a .dat file, see documentation for more details
$.localize = true;

//=================================================================
// Globals
//=================================================================

// ok and cancel button
var runButtonID = 1;
var cancelButtonID = 2;

// UI strings to be localized
var strTitle = localize("$$$/JavaScripts/LayerCompsToWPG/Title=Layer Comps To Web Photo Gallery");
var strButtonRun = localize("$$$/JavaScripts/LayerCompsToWPG/Run=Run");
var strButtonCancel = localize("$$$/JavaScripts/LayerCompsToWPG/Cancel=Cancel");
var strHelpText = localize("$$$/JavaScripts/LayerCompsToWPG/HelpText=Please specify the location where flat image files should be saved. Once Photoshop has saved these files, it will launch Web Photo Gallery to process the imgaes.");
var strLabelDestination = localize("$$$/JavaScripts/LayerCompsToWPG/Destination=Destination:");
var strButtonBrowse = localize("$$$/JavaScripts/LayerCompsToWPG/Browse=&Browse...");
var strLabelStyle = localize("$$$/JavaScripts/LayerCompsToWPG/Style=Style:");
var strCheckboxSelectionOnly = localize("$$$/JavaScripts/LayerCompsToWPG/Selected=&Selected Layer Comps Only");
var strAlertSpecifyDestination = localize("$$$/JavaScripts/LayerCompsToWPG/SpecifyDestination=Please specify destination.");
var strAlertDestinationNotExist = localize("$$$/JavaScripts/LayerCompsToWPG/DestinationDoesNotExist=Destination does not exist.");
var strTitleSelectDestination = localize("$$$/JavaScripts/LayerCompsToWPG/SelectDestination=Select Destination");
var strAlertDocumentMustBeOpened = localize("$$$/JavaScripts/LayerCompsToWPG/OneDocument=You must have a document open to export!");
var strAlertNoLayerCompsFound = localize("$$$/JavaScripts/LayerCompsToWPG/NoComps=No layer comps found in document!");
var strStyle = localize("$$$/JavaScripts/LayerCompsToWPG/Simple=simple");
var strMessage = localize("$$$/JavaScripts/LayerCompsToWPG/Message=Layer Comps To Web Photo Gallery action settings");
var stretDestination = localize( "$$$/locale_specific/JavaScripts/LayerCompsToWPG/ETDestinationLength=160" );
var strAMG = localize( "$$$/MediaGallery/JavaScript/WindowTitle=Adobe Media Gallery" );

// Settings
var numClipSize = 5000; // resize before call WPG (pixel)


main();


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////



///////////////////////////////////////////////////////////////////////////////
// Function: settingDialog
// Usage: create the main dialog
// Input: settings to initialize the dialog with , ExportInfo object
// Return: true if ok, false if cancel
///////////////////////////////////////////////////////////////////////////////
function settingDialog(exportInfo) {

    dlgMain = new Window("dialog", strTitle);

	dlgMain.orientation = 'column';
	dlgMain.alignChildren = 'left';
	
	// -- top of the dialog, first line
    dlgMain.add("statictext", undefined, strLabelDestination);

	// -- two groups, one for left and one for right ok, cancel
	dlgMain.grpTop = dlgMain.add("group");
	dlgMain.grpTop.orientation = 'row';
	dlgMain.grpTop.alignChildren = 'top';
	dlgMain.grpTop.alignment = 'fill';

	// -- group contains four lines
	dlgMain.grpTopLeft = dlgMain.grpTop.add("group");
	dlgMain.grpTopLeft.orientation = 'column';
	dlgMain.grpTopLeft.alignChildren = 'left';
	dlgMain.grpTopLeft.alignment = 'fill';
	
	// -- the second line in the dialog
	dlgMain.grpSecondLine = dlgMain.grpTopLeft.add("group");
	dlgMain.grpSecondLine.orientation = 'row';
	dlgMain.grpSecondLine.alignChildren = 'center';

    dlgMain.etDestination   = dlgMain.grpSecondLine.add("edittext", undefined, exportInfo.destination.toString());
    dlgMain.etDestination.preferredSize.width = StrToIntWithDefault( stretDestination, 160 );

    dlgMain.btnBrowse= dlgMain.grpSecondLine.add("button", undefined, strButtonBrowse);
    dlgMain.btnBrowse.onClick = btnBrowseOnClick;

    // -- the third line in the dialog
    dlgMain.grpThirdLine = dlgMain.grpTopLeft.add("statictext", undefined, strLabelStyle);

    // -- the fourth line in the dialog
    dlgMain.etStyle   = dlgMain.grpTopLeft.add("edittext", undefined, exportInfo.style.toString());
    dlgMain.etStyle.alignment = 'fill';
    dlgMain.etStyle.preferredSize.width = StrToIntWithDefault( stretDestination, 160 );

	// -- the fifth line in the dialog
    dlgMain.cbSelection = dlgMain.grpTopLeft.add("checkbox", undefined, strCheckboxSelectionOnly);
    dlgMain.cbSelection.value = exportInfo.selectionOnly;

	// the right side of the dialog, the ok and cancel buttons
	dlgMain.grpTopRight = dlgMain.grpTop.add("group");
	dlgMain.grpTopRight.orientation = 'column';
	dlgMain.grpTopRight.alignChildren = 'fill';
	
	dlgMain.btnRun = dlgMain.grpTopRight.add("button", undefined, strButtonRun );
    dlgMain.btnRun.onClick = btnRunOnClick;

	dlgMain.btnCancel = dlgMain.grpTopRight.add("button", undefined, strButtonCancel );
    dlgMain.btnCancel.onClick = function() { 
		var d = this;
		while (d.type != 'dialog') {
			d = d.parent;
		}
		d.close(cancelButtonID); 
	}

	dlgMain.defaultElement = dlgMain.btnRun;
	dlgMain.cancelElement = dlgMain.btnCancel;

	dlgMain.grpBottom = dlgMain.add("group");
	dlgMain.grpBottom.orientation = 'column';
	dlgMain.grpBottom.alignChildren = 'left';
	dlgMain.grpBottom.alignment = 'fill';
    
    dlgMain.pnlHelp = dlgMain.grpBottom.add("panel");
    dlgMain.pnlHelp.alignment = 'fill';

    dlgMain.etHelp = dlgMain.pnlHelp.add("statictext", undefined, strHelpText, {multiline:true});
    dlgMain.etHelp.alignment = 'fill';

    // in case we double clicked the file
    app.bringToFront();

    dlgMain.center();
    
    var result = dlgMain.show();
    
    if (cancelButtonID == result) {
       return result;
    }
    
    // get setting from dialog
    exportInfo.destination = dlgMain.etDestination.text;
    exportInfo.style = dlgMain.etStyle.text;
    exportInfo.selectionOnly = dlgMain.cbSelection.value;

    return result;
}


///////////////////////////////////////////////////////////////////////////////
// Function: btnRunOnClick
// Usage: routine is assigned to the onClick method of the run button
// Input: checks the dialog params and closes with the dialog with true
// Return: <none>, dialog is closed with true on success
///////////////////////////////////////////////////////////////////////////////
function btnRunOnClick() {
    // check if the setting is properly
    var destination = dlgMain.etDestination.text;
    if (destination.length == 0) {
        alert(strAlertSpecifyDestination);
        return;
    }
    var testFolder = new Folder(destination);
    if (!testFolder.exists) {
        alert(strAlertDestinationNotExist);
        return;
    }
   
	// find the dialog in this auto layout mess
	var d = this;
	while (d.type != 'dialog') {
		d = d.parent;
	}
	d.close(runButtonID); 
}


///////////////////////////////////////////////////////////////////////////////
// Function: btnBrowseOnClick
// Usage: routine is assigned to the onClick method of the browse button
// Input: pop the selectDialog, and get a folder
// Return: <none>, sets the destination edit text
///////////////////////////////////////////////////////////////////////////////
function btnBrowseOnClick()
{
    var defaultFolder = dlgMain.etDestination.text;
    var testFolder = new Folder(dlgMain.etDestination.text);
    if (!testFolder.exists) defaultFolder = "~";
    var selFolder = Folder.selectDialog(strTitleSelectDestination, defaultFolder);
    if (selFolder != null) {
		dlgMain.etDestination.text = selFolder.fsName;
    }
	dlgMain.defaultElement.active = true;
    return;
}


///////////////////////////////////////////////////////////////////////////////
// Function: ExportInfo
// Usage: object for holding the dialog parameters
// Input: <none>
// Return: object holding the export info
///////////////////////////////////////////////////////////////////////////////
function ExportInfo() {
    this.destination = new String("");
    this.selectionOnly = false;
    this.style = new String(strStyle);

    try {
        this.destination = Folder(app.activeDocument.fullName.parent).fsName;
    } 
    catch(someError) {
        // do nothing, stop error propagation only
    }
}


///////////////////////////////////////////////////////////////////////////////
// Function: getTempFolder
// Usage: create a temp folder using random numbers
// Input: none
// Return: a new blank folder to put files in temporarily 
///////////////////////////////////////////////////////////////////////////////
function getTempFolder()
{
    var tempLocation;
    var folder = Folder.temp; // File(exportInfo.destination).parent;
    while(true) {   // set temporary folder with random name
        tempLocation = folder.toString() + "/temp" + Math.floor(Math.random()*10000);
        var testFolder = new Folder(tempLocation);
        if (!testFolder.exists) {
            testFolder.create();
            break;
        }
    }
    return tempLocation;
}


///////////////////////////////////////////////////////////////////////////////
// Function: zeroSuppress
// Usage: create a string padded with 0's
// Input: num and number of digits to pad
// Return: zero padded num
///////////////////////////////////////////////////////////////////////////////
function zeroSuppress (num, digit) {
    var tmp = num.toString();
    while(tmp.length < digit)   tmp = "0" + tmp;
    return tmp
}


///////////////////////////////////////////////////////////////////////////////
// Function: objectToDescriptor
// Usage: create an ActionDescriptor from a JavaScript Object
// Input: JavaScript Object (o)
//        Pre process converter (f)
// Return: ActionDescriptor
// NOTE: Only boolean, string, and number are supported, use a pre processor
//       to convert (f) other types to one of these forms.
///////////////////////////////////////////////////////////////////////////////
function objectToDescriptor (o, f) {
	if (undefined != f) {
		o = f(o);
	}
	var d = new ActionDescriptor;
	var l = o.reflect.properties.length;
	for (var i = 0; i < l; i++ ) {
		var k = o.reflect.properties[i].toString();
		if (k == "__proto__" || k == "__count__" || k == "__class__" || k == "reflect")
			continue;
		var v = o[ k ];
		k = app.stringIDToTypeID(k);
		switch ( typeof(v) ) {
			case "boolean":
				d.putBoolean(k, v);
				break;
			case "string":
				d.putString(k, v);
				break;
			case "number":
				d.putDouble(k, v);
				break;
			default:
				throw( new Error("Unsupported type in objectToDescriptor " + typeof(v) ) );
		}
	}
    return d;
}


///////////////////////////////////////////////////////////////////////////////
// Function: descriptorToObject
// Usage: update a JavaScript Object from an ActionDescriptor
// Input: JavaScript Object (o), current object to update (output)
//        Photoshop ActionDescriptor (d), descriptor to pull new params for object from
//        JavaScript Function (f), post process converter utility to convert
// Return: Nothing, update is applied to passed in JavaScript Object (o)
// NOTE: Only boolean, string, and number are supported, use a post processor
//       to convert (f) other types to one of these forms.
///////////////////////////////////////////////////////////////////////////////
function descriptorToObject (o, d, f) {
	var l = d.count;
	for (var i = 0; i < l; i++ ) {
		var k = d.getKey(i); // i + 1 ?
		var t = d.getType(k);
		strk = app.typeIDToStringID(k);
		switch (t) {
			case DescValueType.BOOLEANTYPE:
				o[strk] = d.getBoolean(k);
				break;
			case DescValueType.STRINGTYPE:
				o[strk] = d.getString(k);
				break;
			case DescValueType.DOUBLETYPE:
				o[strk] = d.getDouble(k);
				break;
			case DescValueType.INTEGERTYPE:
			case DescValueType.ALIASTYPE:
			case DescValueType.CLASSTYPE:
			case DescValueType.ENUMERATEDTYPE:
			case DescValueType.LISTTYPE:
			case DescValueType.OBJECTTYPE:
			case DescValueType.RAWTYPE:
			case DescValueType.REFERENCETYPE:
			case DescValueType.UNITDOUBLE:
			default:
				throw( new Error("Unsupported type in descriptorToObject " + t ) );
		}
	}
	if (undefined != f) {
		o = f(o);
	}
}


///////////////////////////////////////////////////////////////////////////////
// Function: main
// Usage: the main routine for this JavaScript
// Input: <none>
// Return: <none>
///////////////////////////////////////////////////////////////////////////////
function main() {
    if (app.documents.length <= 0) {
        if ( DialogModes.NO != app.playbackDisplayDialogs ) {
            alert(strAlertDocumentMustBeOpened);
        }
    	return 'cancel'; // quit, returning 'cancel' (dont localize) makes the actions palette not record our script
    }

	// create our default params
    var exportInfo = new ExportInfo();

	// look for last used params via Photoshop registry, getCustomOptions will throw if none exist
	try {
		var d = app.getCustomOptions("a4cda978-47c8-4a1c-9cec-03e8e81273e8");
		descriptorToObject(exportInfo, d);
	}
	catch(e) {
		// it's ok if we don't have any options, continue with defaults
	}

	// see if I am getting descriptor parameters
    descriptorToObject(exportInfo, app.playbackParameters);
    
    if ( DialogModes.ALL == app.playbackDisplayDialogs ) {
    	if (cancelButtonID == settingDialog(exportInfo)) {
	    	return 'cancel'; // quit, returning 'cancel' (dont localize) makes the actions palette not record our script
	    }
	}

    try {
        var docName = app.activeDocument.name;

	    tempLocation = getTempFolder();

        var compsName = new String("none");
        var compsCount = app.activeDocument.layerComps.length;
        if (compsCount <= 1) {
            if ( DialogModes.NO != app.playbackDisplayDialogs ) {
                alert (strAlertNoLayerCompsFound);
            }
	    	return 'cancel'; // quit, returning 'cancel' (dont localize) makes the actions palette not record our script
        } else {
            app.activeDocument = app.documents[docName];
            docRef = app.activeDocument;
    
            var tempFileList = new Array();
    
            var orgRulerUnits = app.preferences.rulerUnits;  // save unit
            app.preferences.rulerUnits = Units.PIXELS;

            var exportFileCount = 0;
            for (compsIndex = 0; compsIndex < compsCount; compsIndex++) {
                var compRef = docRef.layerComps[compsIndex];
                if (exportInfo.selectionOnly && !compRef.selected) continue; // selected only
                compRef.apply();
                var duppedDocument = app.activeDocument.duplicate();
                if ((numClipSize < duppedDocument.width.value)||(numClipSize < duppedDocument.height.value)) {
                    var wRatio = duppedDocument.width.value / numClipSize;
                    var hRatio = duppedDocument.height.value / numClipSize;
                    var ratio = Math.max(wRatio, hRatio);               
                    duppedDocument.resizeImage(duppedDocument.width/ratio, duppedDocument.height/ratio);
                }
                var fileNameBody = zeroSuppress(compsIndex+1, 2); // starting 01
                fileNameBody += "_" + compRef.name;
                fileNameBody = fileNameBody.replace(/[:\/\\*\?\"\<\>\|]/g, "_");  // '/\:*?"<>|' -> '_'
                if (fileNameBody.length > 120) fileNameBody = fileNameBody.substring(0,120);
                var tempFile = tempLocation + "/" + fileNameBody + ".psd";
                tempFileList[exportFileCount] = tempFile;
                exportFileCount++;
                tempFile = new File(tempFile);
                if (null != compRef.name)   duppedDocument.info.title = compRef.name;
                if (null != compRef.comment)    duppedDocument.info.caption = compRef.comment;
                duppedDocument.saveAs(tempFile);
                duppedDocument.close();
            }
            app.preferences.rulerUnits = orgRulerUnits; // restore unit
    
            // run Web Photo Gallery
            galleryOptions = new GalleryOptions();
            galleryOptions.layoutStyle = exportInfo.style;
            galleryOptions.addSizeAttributes = true;
            galleryOptions.preserveAllMetadata = true;
            galleryOptions.bannerOptions.siteName = docName;
            galleryOptions.imagesOptions.resizeImages = true;
            galleryOptions.imagesOptions.dimension = 450;
            galleryOptions.imagesOptions.includeFilename = true;
            galleryOptions.imagesOptions.caption = true;
            galleryOptions.imagesOptions.includeTitle = true;
            galleryOptions.thumbnailOptions.includeFilename = true;
            galleryOptions.thumbnailOptions.caption = true;
            galleryOptions.thumbnailOptions.includeTitle = true;
    
            app.makePhotoGallery(Folder(tempLocation), Folder(exportInfo.destination), galleryOptions);
    
            // delete temporary files
            for (compsIndex = 0; compsIndex < exportFileCount; compsIndex++) {
                tempFile = new File(tempFileList[compsIndex]);
                tempFile.remove();
            }
            // delete temprary folder
            var tempFolder = new Folder(tempLocation);
            tempFolder.remove();

	    // run Adobe Media Gallery in Bridge (not working yet)
	    // var bt = new BridgeTalk;
            // bt.target = "bridge";
            // var file = File (exportInfo.destination).toSource ()
            // bt.body = "try { app.browseTo (" + file + "); app.bringToFront(); AMG.createPanel(); app.document.setWorkspace(\" + strAMG + \");} catch(e) { ; }";
            // bt.send();
            
        }

		// save off our last run parameters
		var d = objectToDescriptor(exportInfo);
    	d.putString( app.charIDToTypeID( 'Msge' ), strMessage );
		app.putCustomOptions("a4cda978-47c8-4a1c-9cec-03e8e81273e8", d);

        app.playbackDisplayDialogs = DialogModes.ALL;
        
        // make another one so Photoshop can track them correctly
        var dd = objectToDescriptor(exportInfo);
    	dd.putString( app.charIDToTypeID( 'Msge' ), strMessage );
        app.playbackParameters = dd;

    } 
    catch (e) {
        if ( DialogModes.NO != app.playbackDisplayDialogs ) {
            alert(e);
        }
    	return 'cancel'; // quit, returning 'cancel' (dont localize) makes the actions palette not record our script
    }
}

///////////////////////////////////////////////////////////////////////////
// Function: StrToIntWithDefault
// Usage: convert a string to a number, first stripping all characters
// Input: string and a default number
// Return: a number
///////////////////////////////////////////////////////////////////////////
function StrToIntWithDefault( s, n ) {
    var onlyNumbers = /[^0-9]/g;
    var t = s.replace( onlyNumbers, "" );
	t = parseInt( t );
	if ( ! isNaN( t ) ) {
        n = t;
    }
    return n;
}
// End Layer Comps To WPG.jsx
