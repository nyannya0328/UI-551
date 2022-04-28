//
//  CustomTabBar.swift
//  UI-550
//
//  Created by nyannyan0328 on 2022/04/28.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var currentTab : Tab
    @State var yOffset : CGFloat = 0
    var body: some View {
        GeometryReader{proxy in
            
            let size = proxy.size.width
                
                HStack(spacing:0){
                    
                    ForEach(Tab.allCases,id:\.rawValue){tab in
                    
                        Button {
                            
                            withAnimation{
                                
                                currentTab = tab
                                
                                yOffset = -60
                               
                            }
                            
                            withAnimation(.easeIn(duration: 0.3).delay(0.1)){
                                
                                yOffset = 0
                            }
                        
                            
                            
                        } label: {
                            
                            Image(tab.rawValue)
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(currentTab == tab ? Color("Purple") : .gray)
                                .frame(width: 30, height: 30)
                                .frame(maxWidth:.infinity)
                                .scaleEffect(currentTab == tab && yOffset != 0 ? 1.5 : 1)
                            
                             
                        }

                }
                   
                
            }
              
               
                .frame(maxWidth:.infinity)
                .background(alignment: .leading) {
                    Circle()
                        .fill(Color("Yellow"))
                        .frame(width: 20, height: 20)
                        .offset(x: 10,y:yOffset)
                        .offset(x:indicatorOffset(width: size))
                     
                   
                    
                }
            
          
              
                
            
            
        }
        .frame(height: 30)
        .padding([.horizontal,.top])
           .padding(.bottom,10)
    }
    
    func indicatorOffset(width : CGFloat) -> CGFloat{
        
        let index = CGFloat(getIndex())
        
        if index == 0{return 0}
        
        let buttonWidht = width / CGFloat(Tab.allCases.count)
        
        return index * buttonWidht
        
    }
    func getIndex()->Int{
        
        switch currentTab {
        case .bookmark:
            return 0
        case .time:
            return 1
        case .camera:
            return 2
        case .chat:
            return 3
        case .settings:
            return 4
        }
        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
