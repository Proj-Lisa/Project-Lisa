extends Node

#score trackers for objective #1
var max1Count = 0
var current1Count = 0
var start1 = false #hide tracker until Mona finds the quest

#also hide the glow until active?

#score trackers for objective #2
var max2Count = 0
var current2Count = 0
var start2 = false

#score trackers for objective #3
var max3Count = 0
var current3Count = 0
var start3 = false

@onready var txtCollect1 = $txtCollect1 #str() converts these figures to text for outputting to Labels

var txt1XOffset = 20
var txt1YOffset = 5
#create a list order (vector?) for collected/questStarted macguffin order, so they bump existing
#eg, first is closest to Mona/corner (a setting?!), and second is second farthest away, etc.

#on launch, state number of macguffins to get
func _ready() -> void:
	txtCollect1.text = "Get " + str(max1Count) + "macGuffins!"
	#create other texts
	
	#add conditional to hide until quest giver gives it

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#keep UI relative to Mona
	txtCollect1.position.x = %Mona.position.x + txt1XOffset
	txtCollect1.position.y = %Mona.position.y + txt1YOffset

func addMacGuff1():
	current1Count += 1
	txtCollect1.text = "Got " + str(current1Count) + "/" + str(max1Count) +" !"
