import SwiftUI

struct SampleContentView: View {
    @StateObject private var viewModel = OfferwallViewModel()
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 12) {
                Spacer()
                
                Text("Besitos SDK")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(Color(red: 0.1, green: 0.1, blue: 0.1))
                
                Text("Click below to view offers")
                    .font(.system(size: 16))
                    .foregroundColor(.gray)
                
                Button(action: {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let rootVC = windowScene.windows.first?.rootViewController {
                        
                        // Default testing config
                        viewModel.partnerId = "CwI606dZ"
                        viewModel.userId = "user_123"
                        viewModel.launchOfferwall(from: rootVC)
                    }
                }) {
                    Text("Offers")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 15)
                        .background(Color(red: 0.94, green: 0, blue: 0))
                        .cornerRadius(30)
                        .shadow(color: Color(red: 0.94, green: 0, blue: 0).opacity(0.3), radius: 8, x: 0, y: 4)
                }
                .padding(.top, 20)
                
                Spacer()
                Spacer()
            }
        }
        .alert(isPresented: $viewModel.showErrorAlert) {
            Alert(
                title: Text("SDK Error"),
                message: Text(viewModel.errorMessage ?? "An unknown error occurred"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct SampleContentView_Previews: PreviewProvider {
    static var previews: some View {
        SampleContentView()
    }
}
