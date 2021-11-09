# FloatingMenuActionButton

## Example

<p align="left">
  <img src="./gif/demo.gif" width="150" />
</p>

## Overview

This is an open-source library to use with SwiftUI. It allows you to create Floating menu action button.


## Installation

### Swift Package Manager
To integrate `FloatingMenuActionButton` into your Xcode project using Xcode 12, specify it in `File > Swift Packages > Add Package Dependency...`:

```ogdl
https://github.com/YugoMatsuda/FloatingMenuActionButton
```

## Usage

```swift
import SwiftUI
import FloatingMenuActionButton

struct ContentView: View {
    @State var isSelected = false
    @State private var showOtherView = false
    var body: some View {
        ZStack {
            if isSelected {
                Color.gray.edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.2)) {
                            isSelected.toggle()
                        }
                    }
            }
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    FloatingMenuActionButton(isSelected: $isSelected, floatingMenuItems: generateFloatingMenuItems())
                }
                .padding()
            }
        }
        .sheet(isPresented: $showOtherView) {
            Text("Other View")
        }
    }
    
    private func generateFloatingMenuItems() -> [FloatingMenuItem] {
        return  [ .init(iconName: "pencil", buttonAction: { showOtherView.toggle() }),
                  .init(iconName: "camera.fill", buttonAction: { showOtherView.toggle() }),
                  .init(iconName: "paperplane.fill", buttonAction: { showOtherView.toggle() }),
        ]
    }
}
```
