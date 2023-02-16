//
//  NewsView.swift
//  SwiftUIVK
//


import SwiftUI

struct NewsView: View {
    
    private var APIRequest = VKAPIService()
    
    @ObservedObject var session = SessionSingletone.shared
    
    var body: some View {
        
        NavigationView {
            List(session.news) { newsItem in
                NewsCell(news: newsItem)
            }.navigationBarTitle(Text("News"))
        }
        
        //MARK: Проверка работоспособности запроса
        
        .onAppear {
            APIRequest.newsFeedRequest()
        }
        
        
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}


struct NewsCell: View {
    
    let news: ResponseItem
    
    var body: some View {
    
            VStack(alignment: .leading) {
                Text(DateLoader().transformDateFormat(news.id))
                    .font(.subheadline)
                    .foregroundColor(.black)
                if let text = news.text {
                    Text(text)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }.padding(.leading, 30)
            
        }
    }

