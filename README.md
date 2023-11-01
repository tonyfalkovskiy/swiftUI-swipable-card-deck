# swiftUI-swipable-card-deck

Functional Card deck on clean SwiftUI 

Uses drag gesture to detect removal and automaticaly apply accent color to a card regarding the direction of removal, automatically stacks to the top card by changing offset.

Supports removal actions for both directions:

onCardRemoved: (() -> Void)? for swipe to the left

onCardAdded: (() -> Void)? for swipe to the right

Demo:


![Simulator Screen Recording - iPhone 14 Pro - 2023-11-01 at 16 03 28](https://github.com/tonyfalkovskiy/swiftUI-swipable-card-deck/assets/60240721/d3853cbb-eb2c-4755-a21a-d19423f26082)

