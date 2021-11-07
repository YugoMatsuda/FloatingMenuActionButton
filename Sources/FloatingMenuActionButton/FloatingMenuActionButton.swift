import SwiftUI

@available(iOS 14.0, *)
public struct FloatingMenuActionButton: View {
    @Binding var isSelected: Bool
    let floatingMenuItems: [FloatingMenuItem]
    let mainButtonColor: Color
    let menuButtonColor: Color
    let menuIconColor: Color

    public init(isSelected: Binding<Bool>, floatingMenuItems: [FloatingMenuItem], mainButtonColor: Color = .green, menuButtonColor: Color = .white, menuIconColor: Color = .black) {
        self._isSelected = isSelected
        self.floatingMenuItems = floatingMenuItems
        self.mainButtonColor = mainButtonColor
        self.menuButtonColor = menuButtonColor
        self.menuIconColor = menuIconColor
    }

    public var body: some View {
        VStack {
            if isSelected {
                ForEach(floatingMenuItems) { item in
                    Button {
                        withAnimation(.easeIn(duration: 0.2)) {
                            isSelected.toggle()
                        }
                        item.buttonAction()
                    } label: {
                        Image(systemName: item.iconName)
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    .frame(width: 60, height: 60)
                    .background(menuButtonColor)
                    .foregroundColor(menuIconColor)
                    .clipShape(Circle())
                    .transition(.move(edge: .bottom))
                }
            }
            
            Button {
                withAnimation(.easeIn(duration: 0.2)) {
                    isSelected.toggle()
                }
            } label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
            .frame(width: 60, height: 60)
            .background(mainButtonColor)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotationEffect(.init(degrees: isSelected ? 45 : 0))
        }
    }
}

public struct FloatingMenuItem: Identifiable {
    public let id = UUID()
    public let iconName: String
    public let buttonAction: (() -> Void)
 
    public init(iconName: String, buttonAction: @escaping (() -> Void)) {
        self.iconName = iconName
        self.buttonAction = buttonAction
    }
}
