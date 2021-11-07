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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
