//
//  ItemRow.swift
//  iDine
//
//  Created by Michael on 2022/12/3.
//

import SwiftUI

struct ItemRow: View {
    let item: MenuItem

    var body: some View {
        HStack {
            Image(item.thumbnailImage)

            Text(item.name)
            Text("$\(item.price)")
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
