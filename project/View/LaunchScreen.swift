import SwiftUI

struct LaunchScreen: View {
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    @State private var scale: CGFloat = 1.0
    @State private var rotation: Double = 0.0
    private let timer = Timer.publish(every: 0.7, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color("Luanch-Screen_orangebg"),
                    Color("Luanch-Screen_redbg")
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            VStack {
                Image(systemName: "shippingbox.fill")
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .scaleEffect(scale)
                    .rotationEffect(.degrees(rotation))
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.4)) {
                            scale = 50
                        }
                    }
                    .onReceive(timer) { _ in
                        performAnimation()
                    }
                
                Text("Leak khong")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
        }
    }
    
    private func performAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.easeOut(duration: 1)) {
                scale = 0.6
                rotation = 360
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            withAnimation(.easeOut(duration: 3)) {
                scale = 3
            }
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen().environmentObject(LaunchScreenManager())
    }
}
