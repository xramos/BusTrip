//
//  ReportDatePicker.swift
//  BusTrip
//
//  Created by Xavier Ramos on 29/6/24.
//

import SwiftUI
import PreviewSnapshots

struct ReportDatePicker: View {
    
    @State var dateString: String = ""
    @State var isExpanded: Bool = false
    
    let placeholder: String
    @Binding var date: Date
    let minimumDate: Date
    let maximumDate: Date
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
                
                VStack(alignment: .leading) {
                    
                    Text(placeholder)
                        .fontWeight(.bold)
                    
                    Text("\(dateString)")
                }
                
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                
                self.udpateDateString()
                self.isExpanded.toggle()
            }
            
            if self.isExpanded {
                
                DatePicker("",
                           selection: $date,
                           in: minimumDate...maximumDate)
                .labelsHidden()
                .environment(\.timeZone, TimeZone.current)
                .environment(\.locale, Locale.current)
                .datePickerStyle(GraphicalDatePickerStyle())
                .onChange(of: date) { oldValue, newValue in
                    
                    udpateDateString()
                }
            }
        }
        .padding(Constants.padding)
        .background(Color.surface)
        .clipShape(RoundedRectangle(cornerRadius: Constants.cornerRadius))
        .onAppear {
            
            udpateDateString()
        }
    }
}

fileprivate extension ReportDatePicker {
    
    func udpateDateString() {
        
        let formatter = DateFormatter.shortTotalWithLocale
        dateString = formatter.string(from: $date.wrappedValue)
    }
}

// MARK: - Previews

struct ReportDatePicker_ColorScheme_Previews: PreviewProvider {
    
    static var previews: some View {
        
        ForEach(ColorScheme.allCases, id: \.self) {
            
            ReportDatePicker(placeholder: "Report date:",
                             date: .constant(Date()),
                             minimumDate: Date(),
                             maximumDate: Date())
            .preferredColorScheme($0)
        }
    }
}

struct ReportDatePicker_Previews: PreviewProvider {
    
    static var previews: some View {
        
        snapshots.previews.previewLayout(.sizeThatFits)
    }
    
    static var snapshots: PreviewSnapshots<String> {
        
        PreviewSnapshots(configurations: [
            .init(name: "Default", state: "")
        ], configure: { state in
            
            ReportDatePicker(placeholder: "Report date:",
                             date: .constant(Date()),
                             minimumDate: Date(),
                             maximumDate: Date())
        })
    }
}
