//
//  FavoriteView.swift
//  PLHSwiftProject
//
//  Created by pulinghao on 2021/12/31.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var fav : Favorite
    
    var body: some View {
        List{
            Section(){
                ForEach(fav.items){ item in
                    Text(item.name)
                }
            }
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView().environmentObject(Favorite())
    }
}
