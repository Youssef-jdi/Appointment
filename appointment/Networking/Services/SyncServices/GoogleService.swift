//
//  GoogleService.swift
//  appointment
//
//  Created by Rachel Polachova on 20/03/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import Foundation

protocol GoogleServiceProtocol {
    /// Fetches Google calendar data
    /// - Parameters:
    ///   - token: user's authorization token
    ///   - completion: completion handler
    func getGoogleCalendar(with token: String, completion: @escaping (Result<GoogleCalendarResposne, SyncServiceError>) -> Void)
    
    /// Fetches contacts from Google account
    /// - Parameters:
    ///   - token: user's authorization token
    ///   - completion: completion handler
    func getGoogleContacts(with token: String, completion: @escaping (Result<GmailContactsResponse, SyncServiceError>) -> Void)
}

class GoogleService: GoogleServiceProtocol {
    
    func getGoogleCalendar(with token: String, completion: @escaping (Result<GoogleCalendarResposne, SyncServiceError>) -> Void) {
        guard let url = URL(string: "https://www.googleapis.com/calendar/v3/users/me/calendarList") else { return }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let err = error {
                completion(.failure(.googleError(err)))
                print("Error getting google calendar: \(err.localizedDescription)")
            }
            
            if let resp = response {
                print("Googla calendar response: \(resp)")
            }
            
            if let data = data {
                do {
                    let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                    print("Google calendar result: \(result)")
                    let googleResponse = try JSONDecoder().decode(GoogleCalendarResposne.self, from: data)
                    print("Google response json: \(googleResponse)")
                    completion(.success(googleResponse))
                } catch {
                    completion(.failure(.underlying(error)))
                    print("Error parsing data in google calendar: \(error.localizedDescription)")
                }
            }
        }.resume()
    }
    
    func getGoogleContacts(with token: String, completion: @escaping (Result<GmailContactsResponse, SyncServiceError>) -> Void) {
        guard let url = URL(string: "https://www.google.com/m8/feeds/contacts/default/full?access_token=\(token)&max-results=\(999)&alt=json&v=3.0") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let err = error {
                print("Error getting contacts: \(err.localizedDescription)")
            }
            
            if let resp = response {
                print(resp)
            }
            
            if let data = data {
                do {
                    // TODO: Upload result to our server
                    let result = try JSONDecoder().decode(GmailContactsResponse.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(.googleError(error)))
                }
            }
        }.resume()
    }
}
