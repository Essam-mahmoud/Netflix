//
//  HomeViewModel.swift
//  Netflix
//
//  Created by Essam Orabi on 12/04/2022.
//

import Foundation

class HomeViewModel: ViewModel {

    var MoviesResult: Movies?
    func getMovies(onComplete: @escaping(_ errorMessage : String?,_ ErrorResponse:ResponseModel?, _ state:State)->()) {
        let params = ["api_key":"c9856d0cb57c3f14bf75bdc6c063b8f3"] as [String: Any]
        let url = AppConstant.getMovies
        let  encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let resource = Resource<Movies>(url: encodedUrl,httpMethod:.get,parameters:params, header:[:])
        HttpApiCallingWithRep.requestWithBody(resource: resource) { (Result, StatusCode, Mesg, errorResponse) in
            if StatusCode == 200 {
                if let info = Result{
                    self.MoviesResult = info
                    onComplete(nil, nil, .populated)
                } else {
                    onComplete(Mesg, errorResponse, .error)
                }
            } else {
                onComplete(Mesg, errorResponse, .error)
            }
        }
    }
}
