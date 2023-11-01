# swiftUI-swipable-card-deck

Functional Card deck on clean SwiftUI 

Uses drag gesture to detect removal and automaticaly apply accent color to a card regarding the direction of removal, automatically stacks to the top card by changing offset.

Supports removal actions for both directions:

onCardRemoved: (() -> Void)? for swipe to the left

onCardAdded: (() -> Void)? for swipe to the right

Demo:


![Simulator Screen Recording - iPhone 14 Pro - 2023-11-01 at 16 03 28](https://github.com/tonyfalkovskiy/swiftUI-swipable-card-deck/assets/60240721/e88bcb10-227f-43d9-b646-8ec2524c4b0a)

