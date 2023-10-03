import SwiftUI

struct MarsTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
        .font(.largeTitle)
        .fontWeight(.semibold)
        .foregroundStyle(
            LinearGradient(
                colors: [.orange,
                         .accentColor],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

extension View {
    func marsTitle() -> some View {
        modifier(MarsTitle())
    }
}
