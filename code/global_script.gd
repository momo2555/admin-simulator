extends Node

enum {UP, DOWN, BOSS}
var sens = UP setget set_sens
var folie = 0
var vitessejauge = 0.01
var pv = 100
var dialoging = false;

func set_sens(value):
	sens = value
	
var speed = 180

	
