Red [title: "Pomoplan" needs: view]

; variables used to make porting easier
task-list-size: 550x150
window-size: 600x600

task: object [ ; basic "task" object that others inherit from
	text: ""
	priority: 1 ; 1 is today, 2 is week, 5 is unknown, and so on
	length: 'short ; 'short or 'long
]

priorities: [today week month year unknown] ; use this with "priority" value to access above series

view [

	title "Pomoplan"
	size window-size
	

	; task lists and scroller
	
	across
	
	tasks: panel [
		below

		text "Today: "
		today: text-list task-list-size data []
		
		text "Week: "
		week: text-list task-list-size data []
		
		text "Month: "
		month: text-list task-list-size data []
		
		text "Year: "
		year: text-list task-list-size data []
		
		text "Unknown: "
		unknown: text-list 550x150 data []
	]
	
	scroll: base 16x200 loose react [

		face/offset/y: (max (min ((window-size / 2) + 95) face/offset/y) 5)
		face/offset/x: scrollx
		tasks/offset/y: to integer! negate face/offset/y
	]

	do [scrollx: scroll/offset/x]
	
	; task maker. NEED TO FIND A WAY TO INTEGRATE THIS INTO EXISTING GUI
	below

	text "Title: "
	a-title: area
	return

	text "Priority: "
	a-priority: text-list data ["Today" "Week" "Month" "Year" "Unknown"]
	return

	text "Length: "
	a-radio-short: radio "Short"
	radio "Long"
	do [a-radio-short/data: true]
	return

]
