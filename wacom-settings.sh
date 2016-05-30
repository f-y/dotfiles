#!/bin/bash

DEVICE="Wacom Bamboo 2FG 4x5"

STYLUS="$DEVICE Pen stylus"
ERASER="$DEVICE Pen eraser"
TOUCH="$DEVICE Finger touch"
PAD="$DEVICE Pad pad"

## STYLUS
xsetwacom set "$STYLUS" Button 1 1
# set Right click to the lower pen button
xsetwacom set "$STYLUS" Button 2 3
# set Double click to the upper pen button
xsetwacom set "$STYLUS" Button 3 "Button 1 Button 1"

## TOUCH
xsetwacom set "$TOUCH" Touch "off"

## PAD

