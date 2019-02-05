Red [title: "Pomoplan" needs: view] 

; variables used to make porting easier
task-list-size: 450x150
window-size: 600x600

todo: object [ ; basic "task" object that others inherit from
	text: ""
	priority: 1 ; 1 is today, 2 is week, 5 is unknown, and so on
	length: 'short ; 'short or 'long
]

view [

	title "Pomoplan"
	size window-size
	tab-panel [
		"Tasks" [ ; list of existing tasks
			 across
				
				tasks: panel [
					below

					text "Today: "
					today: text-list task-list-size data [] [
						alter face/data face/data/(face/selected)
					]
					
					text "Week: "
					week: text-list task-list-size data [] [
						alter face/data face/data/(face/selected)
					]
					
					text "Month: "
					month: text-list task-list-size data [] [
						alter face/data face/data/(face/selected)
					]
					
					text "Year: "
					year: text-list task-list-size data [] [
						alter face/data face/data/(face/selected)
					]
					
					text "Unknown: "
					unknown: text-list task-list-size data [] [
						alter face/data face/data/(face/selected)
					]
				]
				

				scroll: base 16x200 loose react [

					face/offset/y: (max (min ((window-size / 2) + 85) face/offset/y) 5)
					face/offset/x: scrollx
					tasks/offset/y: to integer! negate face/offset/y
				]

				do [scrollx: scroll/offset/x]


		]
		"New task" [ ; dialogue to create new tasks
			panel [
				below

				text "Title: "
				a-title: area

				return

				text "Priority: "
				a-priority: text-list data ["Today" "Week" "Month" "Year" "Unknown"]

				across
				return

				button "Submit" [
					switch a-priority/selected [
						1 [append today/data (copy a-title/text)]
						2 [append week/data (copy a-title/text)]
						3 [append month/data (copy a-title/text)]
						4 [append year/data (copy a-title/text)]
						5 [append unknown/data (copy a-title/text)]
					]


				]
			]
		]
	]
]
