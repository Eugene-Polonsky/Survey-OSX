import SwiftUI
struct ContentView: View {
    // TODO: right now we're initializing the ViewModel with a mock server. Later
    // we'll switch that to use a real one, and only use MockServer for testing.
    @StateObject private var viewModel = SurveyViewModel(server: MockServer())
    var body: some View {
        VStack {
            if let inquiry = viewModel.inquiries.first {
                SurveyView(question: inquiry.question)
            } else {
                EmptyView()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .onAppear {
            viewModel.loadInquiries()
        }
    }
}
