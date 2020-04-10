# Get Windows colors, type ramp, and motion library out of the box
# For more info see https://github.com/Microsoft/windows-framer-toolkit
{SystemColor} = require 'SystemColor'
{Type} = require 'type'
motion = require 'motionCurves'
{Button} = require 'windows-framer-toolkit-master/Controls/Actions/Button'
{ContextMenu} = require 'windows-framer-toolkit-master/Controls/Overlays/ContextMenu'
{TreeView} = require 'windows-framer-toolkit-master/Controls/Navigation/TreeView'

# If you want the purple outlines, comment this out
# Framer.Extras.Hints.disable()

button = new Button
	label: "Check"

helloWorld = new Type
	uwpStyle: "header"
	text: "test!"

commands = ["reply", "reply all", "forward"]
disabled = [1, 2]
mailOptions = new ContextMenu
	items: commands
	disabledItems: disabled

inboxFolders = new TreeView
	items: items

items = [
	{"itemText" : "Item 1.1", "isExpanded" : true, "children" : [
			{"itemText" : "Item 2.1"},
			{"itemText" : "Item 2.2", "isExpanded" : true, "children" : [
				{"itemText" : "Item 3.1", "isExpanded" : false, "children" : [
					{"itemText" : "Item 4.1"}
					]}]
			}]
	},
	{"itemText" : "Item 1.2", "isExpanded" : true, "children" : [
		{"itemText" : "Item 2.1"},
		{"itemText" : "Item 2.2"},
		{"itemText" : "Item 2.3"},
		{"itemText" : "Item 2.4"}]
	},

	{inboxFolders}

]

inboxFolders.center()

helloWorld.center()