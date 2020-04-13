# Get Windows colors, type ramp, and motion library out of the box
# For more info see https://github.com/Microsoft/windows-framer-toolkit
{SystemColor} = require 'SystemColor'
{Type} = require 'type'
motion = require 'motionCurves'
{Button} = require 'windows-framer-toolkit-master/Controls/Actions/Button'
{ContextMenu} = require 'windows-framer-toolkit-master/Controls/Overlays/ContextMenu'
{EventsEmitter} = require 'events'

# JSON calls
exerciseData = require './exercise_data.json'
currentExercise = 0
tracePoint = 0

# If you want the purple outlines, comment this out
# Framer.Extras.Hints.disable()

Utils.insertCSS('@import url(https://fonts.googleapis.com/css?family=Roboto);')

# Feedback layer definitions (comments in fields represent default values for elements when they appear)

# Correct/incorrect layers and type


incorrectLayer = new Layer
	width: 400
	height: 0 #110
	backgroundColor: "#F85B5B"
	x: Align.center()
	y: Align.bottom()

correctLayer = new Layer
	width: 400
	height: 0 #110
	backgroundColor: "#82C57C"
	x: Align.center()
	y: Align.bottom()

# active state definitions

correctLayer.states.active =
	height: 110
	y: Align.bottom()

incorrectLayer.states.active =
	height: 110
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
	label: "CHECK" # CHECK
	width: 350
	height: 50
	x: Align.center()
	y: Align.bottom(-20)
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(47, 89, 43, 0.4)"
	backgroundColor: "#45863F"

checkButton.states.correct = 
	backgroundColor: "#45863F"
	label: "CONTINUE"

checkButton.states.incorrect = 
	backgroundColor: "#9A2525"
	label: "CONTINUE"


# Headings for exercises generated dynamically from JSON

# define parent layer

topTypeParent = new Layer
	width: 400
	height: 80
	backgroundColor:"#FFFFFF"
	x: Align.center()
	y: Align.top()

titleType = new Type
	parent: topTypeParent
	uwpStyle: "header"
	text: exerciseData[currentExercise].header
	x: Align.center(-160)
	y: Align.top()
	scale: .75

definitionSubType1 = new Type
	parent: topTypeParent
	uwpStyle: "subheader"
	text: exerciseData[currentExercise].subheaderPart1
	x: Align.center(-173)
	y: Align.top(42)
	scale: .5

definitionSubType2 = new Type
	parent: topTypeParent
	uwpStyle: "subheader"
	text: exerciseData[currentExercise].subheaderPart2
	x: Align.center(-99)
	y: Align.top(42)
	scale: .5

# Main Tile definition and properties

writingTile = new Layer
	backgroundColor: "#FFFFFF"
	borderWidth: 1.5
	borderColor: "#ababab"
	width: 320
	height: 320
	x: Align.center()
	y: Align.center()
	borderRadius: 15
	shadowBlur: 10
	shadowY: 9
	shadowColor: "rgba(196, 196, 196, 0.6)"

writingCorrect = new Layer
	x: Align.center()
	y: Align.center()
	visible: true
	parent: writingTile
	images: exerciseData[currentExercise].correctImage

writingHint = new Layer
	x: Align.center()
	y: Align.center()
	visible: true
	parent: writingTile
	images: exerciseData[currentExercise].hintImage

writingIncorrect = new Layer
	x: Align.center()
	y: Align.center()
	visible: true
	parent: writingTile
	images: exerciseData[currentExercise].incorrectImage

# Interaction and correctness checkers

answer = false

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

checkButton.on "click", -> userCorrect() 

restoreDefault = ->
	#Reset height of correct and incorrect Layers, opacity of correct and incorrect Text, content of checkButton

userCorrect = ->
	if answer
		# Change height of correct Layer, opacity of correct Text
		checkButton.animate "correct"
		correctLayer.animate "active"
		correctText.animate "active"
	else
		checkButton.animate "incorrect"
		incorrectLayer.animate "active"
		incorrectText.animate "active"


moveExercise = ->
	currentExercise = ++currentExercise
		

# TODO
# Check for keyboard event to store user's correctness, reset this correctness to false after elements
# update visually upon "check" being hit
# Add main canvas and pronunciation interaction
# Add images and image showing functionality to trace and write (implement hints as well), interactive element/canvas
# Improve text spacing on 5th and 6th exercises
# Add interactive elements for 5th and 6th exercises and their answer checking logic
# add sound?

# All exercises, if failed, should return to the default with the same exercise, giving the users another chance