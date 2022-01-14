//
//  CircleGroupView.swift
//  Restart
//
//  Created by Juan Sebastian Orozco Buitrago on 1/12/22.
//

import SwiftUI

struct CircleGroupView: View {
    
    //MARK: - PROPERTY
    
    @State var shapeColor: Color
    @State var shapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZStack"
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

//MARK: - PREVIEW
struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.secondary
                .edgesIgnoringSafeArea(.all)
            CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
        }
    }
}
