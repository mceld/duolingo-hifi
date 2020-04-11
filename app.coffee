# Get Windows colors, type ramp, and motion library out of the box
# For more info see https://github.com/Microsoft/windows-framer-toolkit
{SystemColor} = require 'SystemColor'
{Type} = require 'type'
motion = require 'motionCurves'
{Button} = require 'windows-framer-toolkit-master/Controls/Actions/Button'
{ContextMenu} = require 'windows-framer-toolkit-master/Controls/Overlays/ContextMenu'
{TreeView} = require 'windows-framer-toolkit-master/Controls/Navigation/TreeView'

# JSON calls
exerciseData = require './exercise_data.json'
currentExercise = 0

# If you want the purple outlines, comment this out
# Framer.Extras.Hints.disable()

Utils.insertCSS('@import url(https://fonts.googleapis.com/css?family=Roboto);')

# Feedback layer definitions (comments in fields represent default values for elements when they appear)

# User provides the correct answer

correctLayer = new Layer
	width: 400
	height: 0 #110
	backgroundColor: "#82C57C"
	x: Align.center()
	y: Align.bottom(0)

correctText = new Type
	color: "#45863F"
	text: "You are correct"
	uwpStyle: "body"
	x: Align.center(-110)
	y: Align.bottom(-78)
	opacity: 0 #100

# User provides the inocrrect answer

incorrectLayer = new Layer
	width: 400
	height: 110 #110
	backgroundColor: "#82C57C"
	x: Align.center()
	y: Align.bottom(0)

correctText = new Type
	color: "#45863F"
	text: "You are correct"
	uwpStyle: "body"
	x: Align.center(-110)
	y: Align.bottom(-78)
	opacity: 100 #100

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
	cursor: "pointer"

# Headings for exercises generated dynamically from JSON

titleType = new Type
	uwpStyle: "header"
	text: exerciseData[currentExercise].header
	x: Align.center(-150)
	y: Align.top(10)
	scale: .75

definitionSubType1 = new Type
	uwpStyle: "subheader"
	text: exerciseData[currentExercise].subheaderPart1
	x: Align.center(-162)
	y: Align.top(55)
	scale: .5

definitionSubType2 = new Type
	uwpStyle: "subheader"
	text: exerciseData[currentExercise].subheaderPart2
	x: Align.center(-89)
	y: Align.top(55)
	scale: .5
	fontWeight: 800

# Interaction and correctness checkers

answer = false

setAnswer = (code) ->
	if code == 48
		answer = false
	else if code == 49
		answer = true

# window.addEventListener("keydown", setAnswer(event.keyCode))

window.addEventListener("click", checkButton, userCorrect)

restoreDefault = ->
	#Reset height of correct and incorrect Layers, opacity of correct and incorrect Text, content of checkButton

userCorrect = ->
	alert("yo")
	if answer
		# Change height of correct Layer, opacity of correct Text
		correctLayer.width = 110

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