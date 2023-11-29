// ContentView.swift
// Created by Nate Birkholz

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        ZStack {
            viewModel.backgroundColor
            
            VStack {
                HStack {
                    Spacer()
                    Image(.witch)
                        .resizable()
                        .frame(width: 80, height: 80)
                        .onLongPressGesture {
                            #if DEBUG
                            viewModel.test()
                            #endif
                        }
                    Spacer()
                }
                
                TextEditor(text: .constant(viewModel.jsonString))
                    .scrollDismissesKeyboard(.automatic)
                    .font(.system(size: 14.0))
                    .backgroundStyle(.white)
                    .foregroundStyle(.black)
                    .frame(maxHeight: .infinity)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.black, lineWidth: 4)
                    )
                    .padding(.horizontal, 32)
                HStack {
                    Spacer()

                    makeButton(for: .paste)
                    makeButton(for: .copy)
                    makeButton(for: .clear)
                    
                    Spacer()
                }
                .padding(.top, 32)
                .padding(.bottom, 64)
            }
            .padding(.top, 56)
            .alert(viewModel.alertType == .error ?
                   StringConstants.errorTitle :
                    StringConstants.clearTitle,
                   isPresented: $viewModel.showAlert) {
                if viewModel.alertType == .error {
                    Button(StringConstants.bummerButton) {
                        viewModel.dismiss()
                    }
                } else if viewModel.alertType == .validate {
                    Button(StringConstants.yesButton, role: .destructive) {
                        viewModel.actuallyClear()
                    }
                }
            } message: {
                if viewModel.alertType == .error {
                    Text(viewModel.alertMessage ?? StringConstants.unknonwError)
                }
            }
        }.ignoresSafeArea()
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 1.25)) {
                    viewModel.backgroundColor = Color(.darkBackgroundGreen)
                }
            }
    }
    
    @ViewBuilder
    func makeButton(for type: ButtonType) -> some View {
        HStack {
            VStack {
                Image(systemName: type.imageString)
                    .resizable()
                    .frame(width: 42, height: 42)
                    .aspectRatio(nil, contentMode: .fit)
                    .foregroundStyle(type.color)
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 4, trailing: 16))
                Text(type.labelString)
                    .font(.system(size: 12))
                    .foregroundStyle(.black)
                    .padding(.bottom, 8)
            }
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.black, lineWidth: 2)
            )
            .onTapGesture(perform: {
                buttonAction(for: type)
            })
        }.frame(maxWidth: .infinity)
    }
    
    func buttonAction(for type: ButtonType) {
        switch type {
        case .paste:
            viewModel.paste()
        case .copy:
            viewModel.copy()
        case .clear:
            viewModel.validateClear()
        }
    }
}

#Preview {
    MainView()
}
