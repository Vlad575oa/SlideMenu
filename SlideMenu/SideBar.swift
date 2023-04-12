//
//  SideBar.swift
//  SlideMenu
//
//  Created by user on 11.04.2023.
//

import SwiftUI

struct SideBar: View {
  @EnvironmentObject var vm: ViewModel
  var body: some View {
    VStack {

      user()
        .padding()
      TabItemAndAnimation()
      Projects()
        .padding(.horizontal, 10)
      DarkToggle(vm: _vm)
    
    }
    .frame(maxWidth: 288, maxHeight:  .infinity)
    .background(Color("black"))
    .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
    .frame(maxWidth: .infinity, alignment: .leading)
  }
  @ViewBuilder
  func user() -> some View {
    HStack {
      Image("person")
        .resizable()
        .scaledToFill()
        .offset(y: 5)
        .mask(Circle())
        .frame(width: 60, height: 60)
      VStack {
        Text("name").bold()
          .font(.title2)
          .foregroundColor(.white)
        Text("@name").bold()
          .font(.callout)
          .foregroundColor(.gray)
      }
      Spacer()
      Button {
        withAnimation(.easeIn) {
          vm.isOpen.toggle()
          vm.sideButton.toggle()
        }
      } label: {
        Image(systemName: "xmark")
          .font(.title2)
          .foregroundColor(.white)
      }

    }
  }

  @ViewBuilder
  func TabItemAndAnimation() -> some View {
    VStack(spacing: 0) {
      Rectangle()
        .frame(height: 1)
        .opacity(0.2)
        .foregroundColor(.white)
        .padding(.horizontal)
      ForEach(sidebar) { item in
        Button(action: {
          withAnimation {
            vm.selectedItem = item.tab          }
        }, label: {
          HStack(spacing: 14) {
            Image(systemName: item.icon)
              .font(.headline)
            Text(item.titel)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding()
        })
        .foregroundStyle(vm.selectedItem == item.tab ? .white : .gray)
      }
    }
    .frame(width: 300, height: 250)
    .overlay(content: {
      VStack {
        if vm.selectedItem == .maginf{Spacer()}
        if vm.selectedItem == .rect{Spacer()}

        if vm.selectedItem == .bell{
          Spacer()
          Spacer()
        }
        Rectangle()
          .frame(width: 3, height: 25)
          .foregroundStyle(.green)
          .cornerRadius(2)
          .padding(.vertical, 8)
          .padding(.horizontal,5)
        if vm.selectedItem == .home { Spacer() }
        if vm.selectedItem == .maginf {
          Spacer()
          Spacer()
        }
        if vm.selectedItem == .bell {Spacer()}
      }
      .frame(height: 200)
      .frame(maxWidth: .infinity, alignment: .leading)
    })
  }
}

struct SideBar_Previews: PreviewProvider {
    static var previews: some View {
        SideBar()
        .environmentObject(ViewModel())
    }
}
