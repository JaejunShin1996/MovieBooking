//
//  BookingView.swift
//  MovieBooking
//
//  Created by Jaejun Shin on 1/11/2022.
//

import SwiftUI

struct BookingView: View {
    @Environment(\.dismiss) var dismiss

    @State var gradient = [Color("backgroundColor2").opacity(0), Color("backgroundColor2"), Color("backgroundColor2"), Color("backgroundColor2")]

    @State var selectedDate = false
    @State var selectedHour = false
    @State var bindingSelection = false

    var body: some View {
        NavigationView {
            ZStack {
                Image("booking")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: .infinity, alignment: .top)

                VStack {
                    LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
                        .frame(height: 600)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)

                VStack(spacing: 0.0) {
                    HStack {
                        CircleButton(action: { dismiss() }, image: "arrow.left")

                        Spacer()

                        CircleButton(action: {}, image: "ellipsis")
                    }
                    .padding(EdgeInsets(top: 46, leading: 20, bottom: 0, trailing: 20))

                    Text("Doctor Strange")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 200)

                    Text("in the muliverse of Madness")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(30)

                    Text("Select date and time")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)

                    HStack(alignment: .top, spacing: 20.0) {
                        DateButton(weekDay: "Thu", numDay: "21", isSelected:  $bindingSelection)
                            .padding(.top, 90)

                        DateButton(weekDay: "Thu", numDay: "21", isSelected:  $bindingSelection)
                            .padding(.top, 70)

                        DateButton(weekDay: "Thu", numDay: "21", width: 70, height: 100, isSelected:  $selectedDate) {
                            withAnimation(.spring()) {
                                selectedDate.toggle()
                            }
                        }
                        .padding(.top, 30)

                        DateButton(weekDay: "Thu", numDay: "21", isSelected:  $bindingSelection)
                            .padding(.top, 70)

                        DateButton(weekDay: "Thu", numDay: "21", isSelected:  $bindingSelection)
                            .padding(.top, 90)
                    }

                    HStack(alignment: .top, spacing: 20.0) {
                        TimeButton(hour: "16:00", isSelected: $bindingSelection)
                            .padding(.top, 20)

                        TimeButton(hour: "16:00", isSelected: $bindingSelection)

                        TimeButton(hour: "16:00", width: 70, height: 40, isSelected: $selectedHour) {
                            withAnimation {
                                selectedHour.toggle()
                            }
                        }
                        .padding(.top, -20)

                        TimeButton(hour: "16:00", isSelected: $bindingSelection)

                        TimeButton(hour: "16:00", isSelected: $bindingSelection)
                            .padding(.top, 20)
                    }

                    NavigationLink {
                        SeatsView()
                    } label: {
                        LargeButton()
                    }
                    .padding(.top, 30)
                    .offset(y: selectedDate && selectedHour ? 0 : 200)
                }
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .background(Color("backgroundColor2"))
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView()
    }
}
