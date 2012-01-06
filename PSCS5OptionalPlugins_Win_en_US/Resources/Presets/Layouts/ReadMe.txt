; This is the documentation for the Picture Packager layout files.

; Each layout file details the page size and image drop locations for one resulting document.

; The layout files can contain comments.
; A comment is any line that starts with a semi-colon ';'.
; The semi-colon must be the first character on the line.
; Blank lines are also allowed, and are ignored.

; There are 3 types of information that must be present in each layout file:
; 1) the units and page size
; 2) the description text that is displayed in the dialog
; 3) the layout specs

; As an example to work from, look at the file 'FiveBySevens.txt'. The contents are here also:

;	I 8 10 1
;	(2)5x7
;	0.5 0 7 5
;	0.5 5 7 5

; 1) the units and page size 'I 8 10 1'
; The 4 three fields on line 1 are: units, width and height, and preset flag
; You can enter inches, pixels or centimeters. All the numbers in a single file must be the same units.
; For inches, use i or I.
; For pixels, use p or P.
; For centimeters, use c or C.
; The preset flag is an Adobe preset layouts only. You should set this to 0 (zero),
; or leave it off altogether.

; 2) the description text that is displayed in the dialog '(2) 5 x 7'
; The 1 field on line 2 is the text description shown in the Layout: menu choice on the dialog. 
; This can be any text you want, up to 75 characters long.

; 3) the layout specs '0.5 0 7 5' and '0.5 5 7 5'
; Each line is one drop location for the image. You can have up to 50 drop locations per page.
; The 4 fields are x position, y position, width, and height.
; Remember, the units must match what you used for the page size in line 1.

; So, in summary, the example tells the plugin that all the numbers are entered in inches,
; the resulting document is to be 8 inches wide, 10 inches high, and will have 2 images on it.
; The first image will be located at 1/2 inch from the left edge, and at the very top of the document,
; and will be 7 inches wide, 5 inches high. The second image will be located 1/2 inch from the left edge
; 5 inces from the top edge, and will be 7 inches wide, 5 inches high.