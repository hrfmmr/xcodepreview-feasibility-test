//
//  FeedViewControllerPreview.swift
//  featureA
//
//  Created by hrfm mr on 2021/03/04.
//

// MARK: - Xcode Preview

#if DEBUG && canImport(SwiftUI)
import SwiftUI
private struct Feed_IntegratedController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        FeedViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
}

struct Feed_View: View {
    var body: some View {
        Feed_IntegratedController()
            .edgesIgnoringSafeArea(.all)
    }
}

struct Feed_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            Feed_View()
                .previewDevice("iPhone 12 Pro")
                .previewDisplayName("iPhone 12 Pro")
        }
    }
}
#endif
