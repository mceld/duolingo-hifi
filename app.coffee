# Get Windows colors, type ramp, and motion library out of the box
# For more info see https://github.com/Microsoft/windows-framer-toolkit
{SystemColor} = require 'SystemColor'
{Type} = require 'type'
motion = require 'motionCurves'
{Button} = require 'windows-framer-toolkit-master/Controls/Actions/Button'

# If you want the purple outlines, comment this out
# Framer.Extras.Hints.disable()

button = new Button


helloWorld = new Type
	uwpStyle: "header"
	text: "test!"
	
helloWorld.center()