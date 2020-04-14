# Get Windows colors, type ramp, and motion library out of the box
# For more info see https://github.com/Microsoft/windows-framer-toolkit
{SystemColor} = require 'SystemColor'
{Type} = require 'type'
motion = require 'motionCurves'
{Button} = require 'windows-framer-toolkit-master/Controls/Actions/Button'
{ContextMenu} = require 'windows-framer-toolkit-master/Controls/Overlays/ContextMenu'

# JSON calls
window.exerciseData = require './exercise_data.json'
window.currentExercise = 0
window.tracePoint = 0

# If you want the purple outlines, comment this out
# Framer.Extras.Hints.disable()

Utils.insertCSS('@import url(https://fonts.googleapis.com/css?family=Roboto);')

# Feedback layer definitions (comments in fields represent default values for elements when they appear)

# Correct/incorrect layers and type


incorrectLayer = new Layer
	width: 400
	height: 110 #110
	backgroundColor: "#F85B5B"
	x: Align.center()
	y: Align.bottom(110)
	visible: false

correctLayer = new Layer
	width: 400
	height: 110 #110
	backgroundColor: "#82C57C"
	x: Align.center()
	y: Align.bottom(110)
	visible: false

# animation options

incorrectLayer.animationOptions = 
	time: .5

correctLayer.animationOptions = 
	time: .5

# active state definitions

correctLayer.states.active =
	y: Align.bottom()

incorrectLayer.states.active =
	y: Align.bottom()

# correctness text definitions

correctText = new Type
	parent: correctLayer
	color: "#45863F"
	text: "You are correct"
	uwpStyle: "body"
	x: Align.center(-110)
	y: Align.bottom(-78)
	opacity: 0 #100

incorrectText = new Type
	parent: incorrectLayer
	color: "#9A2525"
	text: "Correct answer shown above"
	uwpStyle: "body"
	x: Align.center(-60)
	y: Align.bottom(-78)
	opacity: 0 #100

# active states definition

correctText.states.active =
	opacity: 100

incorrectText.states.active = 
	opacity: 100

# Definition of main button

checkButton = new Layer
	label: "CHECK"
	width: 350
	height: 50
	x: Align.center()
	y: Align.bottom(-20)
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(47, 89, 43, 0.4)"
	backgroundColor: "#45863F"
	visible: true

continueButton = new Layer
	label: "CONTINUE"
	width: 350
	height: 50
	x: Align.center()
	y: Align.bottom(-20)
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(47, 89, 43, 0.4)"
	backgroundColor: "#45863F"
	visible: false

checkButton.states.correct = 
	backgroundColor: "#45863F"
	label: "CHECK"
	shadowColor: "rgba(47, 89, 43, 0.4)"

checkButton.states.incorrect = 
	backgroundColor: "#9A2525"
	label: "CHECK"
	shadowColor: "rgba(154, 37, 37, 0.4)"

continueButton.states.correct =
	backgroundColor: "#45863F"
	label: "CONTINUE"
	shadowColor: "rgba(47, 89, 43, 0.4)"

continueButton.states.incorrect = 
	backgroundColor: "#9A2525"
	label: "CONTINUE"
	shadowColor: "rgba(154, 37, 37, 0.4)"

checkButton.animationOptions = 
	time: .2

continueButton.animationOptions = 
	time: .2

# Headings for exercises generated dynamically from JSON

# define parent layer

topTypeParent = new Layer
	width: 400
	height: 80
	backgroundColor:"#FFFFFF"
	x: Align.center()
	y: Align.top()

titleType = new Type
	width: 400
	parent: topTypeParent
	uwpStyle: "header"
	text: window.exerciseData[window.currentExercise].header
	x: Align.left(-17)
	y: Align.top()
	scale: .75

definitionSubType = new Type
	width: 300
	parent: topTypeParent
	uwpStyle: "subheader"
	text: window.exerciseData[window.currentExercise].subheader
	x: Align.left(-34)
	y: Align.top(42)
	scale: .5

# Main Tile definition and properties

writingTile = new Layer
	visible: true
	backgroundColor: "#FFFFFF"
	borderWidth: 1.5
	borderColor: "#ababab"
	width: 320
	height: 320
	x: Align.center()
	y: Align.center(20)
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(196, 196, 196, 0.6)"

# shift tile up on
writingTile.animate
	y: Align.center()

writingTileImage = new Layer
	width: 280
	height: 280
	backgroundColor: "transparent"
	x: Align.center()
	y: Align.center()
	visible: true
	parent: writingTile
	image: window.exerciseData[window.currentExercise].traceImage


# Tiles for recognition and matching

# parent tile

parentTile = new Layer
	width: 350
	height: 350
	x: Align.center()
	y: Align.center()
	backgroundColor: "transparent"

recogTile1 = new Layer
	borderColor: "#ababab"
	parent: parentTile
	width: 150
	height: 150
	x: Align.left()
	y: Align.top(20)
	borderWidth: 1.5
	borderColor: "#ababab"
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(196, 196, 196, 0.6)"
	visible: false
	backgroundColor:"#FFFFFF"
	image: "images/recogTile1.png"

recogTile1.states.load =
	y: Align.top()

recogTile2 = new Layer
	borderColor: "#ababab"
	parent: parentTile
	width: 150
	height: 150
	x: Align.right()
	y: Align.top(20)
	borderWidth: 1.5
	borderColor: "#ababab"
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(196, 196, 196, 0.6)"
	visible: false
	backgroundColor:"#FFFFFF"
	image: "images/recogTile2.png"

recogTile2.states.load =
	y: Align.top()

recogTile3 = new Layer
	borderColor: "#ababab"
	parent: parentTile
	width: 150
	height: 150
	x: Align.right()
	y: Align.bottom(20)
	borderWidth: 1.5
	borderColor: "#ababab"
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(196, 196, 196, 0.6)"
	visible: false
	backgroundColor:"#FFFFFF"
	image: "images/recogTile3.png"

recogTile3.states.load =
	y: Align.bottom()

recogTile4 = new Layer
	borderColor: "#ababab"
	parent: parentTile
	width: 150
	height: 150
	x: Align.left()
	y: Align.bottom(20)
	borderWidth: 1.5
	borderColor: "#ababab"
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(196, 196, 196, 0.6)"
	visible: false
	backgroundColor:"#FFFFFF"
	image: "images/recogTile4.png"

recogTile4.states.load =
	y: Align.bottom()

parentMatching = new Layer
	visible: true
	width: 350
	height: 350
	x: Align.center()
	y: Align.center()
	backgroundColor: "transparent"

matchingTile1 = new Layer
	#image
	borderColor: "#ababab"
	parent: parentMatching
	width: 100
	height: 100
	x: Align.left()
	y: Align.top(20)
	image: "images/match1.png"
	borderWidth: 1.5
	borderColor: "#ababab"
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(196, 196, 196, 0.6)"
	visible: false
	backgroundColor:"#FFFFFF"

matchingTile1.states.click = 
	borderColor:"#1AA0A9"
	backgroundColor: "rgba(213, 247, 255, 0.6)"
	y: Align.top()

matchingTile1.states.load =
	y: Align.top()

matchingTile2 = new Layer
	#image
	borderColor: "#ababab"
	parent: parentMatching
	width: 100
	height: 100
	x: Align.center()
	y: Align.top(20)
	image: "images/match2.png"
	borderWidth: 1.5
	borderColor: "#ababab"
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(196, 196, 196, 0.6)"
	visible: false
	backgroundColor:"#FFFFFF"

matchingTile2.states.click = 
	borderColor:"#1AA0A9"
	backgroundColor: "rgba(213, 247, 255, 0.6)"
	y: Align.top()

matchingTile2.states.load =
	y: Align.top()

matchingTile3 = new Layer
	#image
	borderColor: "#ababab"
	parent: parentMatching
	width: 100
	height: 100
	x: Align.right()
	y: Align.top(20)
	image: "images/match3.png"
	borderWidth: 1.5
	borderColor: "#ababab"
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(196, 196, 196, 0.6)"
	visible: false
	backgroundColor:"#FFFFFF"

matchingTile3.states.click = 
	borderColor:"#1AA0A9"
	backgroundColor: "rgba(213, 247, 255, 0.6)"
	y: Align.top()

matchingTile3.states.load =
	y: Align.top()

matchingTile4 = new Layer
	#image
	borderColor: "#ababab"
	parent: parentMatching
	width: 100
	height: 100
	x: Align.left()
	y: Align.bottom(-90)
	image: "images/match4.png"
	borderWidth: 1.5
	borderColor: "#ababab"
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(196, 196, 196, 0.6)"
	visible: false
	backgroundColor:"#FFFFFF"

matchingTile4.states.click = 
	borderColor:"#1AA0A9"
	backgroundColor: "rgba(213, 247, 255, 0.6)"
	y: Align.bottom(-110)

matchingTile4.states.load =
	y: Align.bottom(-110)

matchingTile5 = new Layer
	#image
	borderColor: "#ababab"
	parent: parentMatching
	width: 100
	height: 100
	x: Align.center()
	y: Align.bottom(-90)
	image: "images/match5.png"
	borderWidth: 1.5
	borderColor: "#ababab"
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(196, 196, 196, 0.6)"
	visible: false
	backgroundColor:"#FFFFFF"

matchingTile5.states.click = 
	borderColor:"#1AA0A9"
	backgroundColor: "rgba(213, 247, 255, 0.6)"
	y: Align.bottom(-110)

matchingTile5.states.load =
	y: Align.bottom(-110)

matchingTile6 = new Layer
	#image
	borderColor: "#ababab"
	parent: parentMatching
	width: 100
	height: 100
	x: Align.right()
	y: Align.bottom(-90)
	image: "images/match6.png"
	borderWidth: 1.5
	borderColor: "#ababab"
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(196, 196, 196, 0.6)"
	visible: false
	backgroundColor:"#FFFFFF"

matchingTile6.states.click = 
	borderColor:"#1AA0A9"
	backgroundColor: "rgba(213, 247, 255, 0.6)"
	y: Align.bottom(-110)

matchingTile6.states.load =
	y: Align.bottom(-110)

# hint button and pronunciation aide

topOfTileParent = new Layer
	backgroundColor: "transparent"
	height: 50
	x: Align.center()
	y: Align.center(-200)
	borderStyle: "dotted"
	borderWidth:
        top: 0
        right: 0
        bottom: 8
        left: 0

wordDisplayType = new Type
	parent: topOfTileParent
	uwpStyle: "subheader"
	text: window.exerciseData[window.currentExercise].pronunciation
	x: Align.center(-270)
	y: Align.center(-209)

wordDisplayPopUp = new Layer


hintButton = new Layer
	parent: writingTile
	width: 50
	height: 50
	backgroundColor: "#1AA0A9"
	label: "HINT"
	borderRadius: 15
	shadowBlur: 10
	shadowY: 4
	shadowColor: "rgba(26, 159, 169, 0.35)"
	x: Align.left(-75)
	y: Align.center()
	opacity: 0

hintButton.states.load = 
	opacity: 100

hintButton.states.used = 
	backgroundColor: "grey"
	opacity: .4



# Interaction and correctness checkers

answer = true

setAnswer = (code) ->
	if code == 48 # 0 on keyboard
		answer = false
	else if code == 49 # 1 on keyboard
		answer = true

# check for event keycode and run to setAnswer
# window.addEventListener("keydown", setAnswer(event.keyCode))

# Events.wrap(checkButton).addEventListener "click", (event) ->
# 	layer.width = Screen.width
# 	layer.height = Screen.height

window.addEventListener "keypress", (e) => setAnswer(e.keyCode)

checkButton.on "click", -> userCorrect()
continueButton.on "click", -> moveExercise()

restoreDefault = ->
	
	if window.currentExercise > 5
		return null
	
	if window.exerciseData[window.currentExercise].exerciseName == "writeChinese" or window.exerciseData[window.currentExercise].exerciseName == "writeRussian"
		writingTileImage.image = ""
		hintButton.animate "load"
	if window.exerciseData[window.currentExercise].exerciseName == "traceChinese" or window.exerciseData[window.currentExercise].exerciseName == "traceRussian"
		console.log("yo")
		writingTileImage.image = window.exerciseData[window.currentExercise].traceImage
		hintButton.animate "default"

	if window.currentExercise == 4 or window.currentExercise == 5
		topOfTileParent.visible = false
		writingTile.visible = false
		titleType.scale = .5
		titleType.x = Align.left(-105)
		titleType.y = 0
		titleType.width = 600

	if window.currentExercise == 4
		for tile in parentTile.children
			tile.visible = true
			tile.animate "load"

	if window.currentExercise == 5
		for i in parentTile.children
			i.visible = false
		
		for j in parentMatching.children
			j.visible = true
			j.animate "load"
		# for tile in parentMatching
		# 	tile.visible = true
		# 	tile.animate "load"

	checkButton.animate "default"
	continueButton.animate "default"

	correctLayer.animate "default"
	incorrectLayer.animate "default"

	correctText.animate "default"
	incorrectText.animate "default"

	titleType.text = window.exerciseData[window.currentExercise].header
	definitionSubType.text = window.exerciseData[window.currentExercise].subheader
	wordDisplayType.text = window.exerciseData[window.currentExercise].pronunciation
	answer = true

moveExercise = ->

	if answer
		window.currentExercise = ++window.currentExercise
	restoreDefault()
	console.log(window.exerciseData[window.currentExercise])

	#Reset height of correct and incorrect Layers, opacity of correct and incorrect Text, content of checkButton

userCorrect = ->
	if answer
		# Change height of correct Layer, opacity of correct Text
		if window.exerciseData[window.currentExercise].exerciseName == "writeChinese" or window.exerciseData[window.currentExercise].exerciseName == "writeRussian" or window.exerciseData[window.currentExercise].exerciseName == "traceRussian" or window.exerciseData[window.currentExercise].exerciseName == "traceChinese"
			writingTileImage.image = window.exerciseData[window.currentExercise].correctImage

		checkButton.animate "correct"
		checkButton.visible = false

		continueButton.visible = true
		continueButton.animate "correct"

		correctLayer.animate "active"
		correctLayer.visible = true

		correctText.animate "active"

	else
		if window.exerciseData[window.currentExercise].exerciseName == "writeChinese" or window.exerciseData[window.currentExercise].exerciseName == "writeRussian" or window.exerciseData[window.currentExercise].exerciseName == "traceRussian" or window.exerciseData[window.currentExercise].exerciseName == "traceChinese"
			writingTileImage.image = window.exerciseData[window.currentExercise].incorrectImage

		checkButton.animate "incorrect"
		checkButton.visible = false

		continueButton.visible = true
		continueButton.animate "incorrect"

		incorrectLayer.animate "active"
		incorrectLayer.visible = true

		incorrectText.animate "active"



# TODO
# Check for keyboard event to store user's correctness, reset this correctness to false after elements
# Add main canvas and pronunciation interaction
# Add images and image showing functionality to trace and write (implement hints as well), interactive element/canvas
# Improve text spacing on 5th and 6th exercises
# Add interactive elements for 5th and 6th exercises and their answer checking logic
# add sound?

# All exercises, if failed, should return to the default with the same exercise, giving the users another chance