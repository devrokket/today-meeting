import SwiftUI

struct ErrorView: View {
    let errorWrapper : ErrorWrapper
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView{
            VStack {
                Text("에러가 발견되었습니다!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial) //배경 색 흐리게
            .cornerRadius(16) // 기능?
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("무시") {
                        dismiss()
                    }
                    
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError : Error {
        case ErrorRequired
    }
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.ErrorRequired,
                    guidance: "무시해도 되는 에러입니다.")
    }
    
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}


