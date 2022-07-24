//
//  CollegeController.swift
//  University(Open API, Review)
//
//  Created by Erik Jimenez on 4/24/22.
//

import Foundation
import UIKit


public class CollegeController {
    
    static let shared = CollegeController()
    var colleges: [Colleges] = []
    
    
    static let baseURL = URL(string: "https://api.collegeai.com/")
    static let version = "v1"
    static let api = "api"
    static let collegeComponent = "college"
    static let infoComponent = "info"
    //Query
    static let apiKey = "Your_API_Key"
    static let collegeNamesKey = "college_names"
    static let infoIDTerm = "info_ids"
    //InfoID
    static let websiteKey = "website"
    static let shortDescriptionKey = "shortDescription"
    static let longDescriptionKey = "longDescription"
    static let campusImageKey = "campusImage"
    static let cityKey = "city"
    static let stateAbbrKey = "stateAbbr"
    static let roomAndBoardKey = "roomAndBoard"
    static let acceptanceRateKey = "acceptanceRate"
    static let privatePublicKey = "privatePublic"
    static let raceEthnicityKey = "raceEthnicity"
    static let similarCollegesKey = "similarColleges"
    
    static let querySet = [websiteKey,shortDescriptionKey,longDescriptionKey,campusImageKey,cityKey, stateAbbrKey,roomAndBoardKey,acceptanceRateKey,privatePublicKey,raceEthnicityKey,similarCollegesKey]
    
    
    static func fetchCollege(searchTerm: String, completion: @escaping ([Colleges]) -> Void){
        
        guard let baseURL = baseURL else {return}
        let versionURL = baseURL.appendingPathComponent(version)
        let apiURL = baseURL.appendingPathComponent(api)
        let collegeURL = baseURL.appendingPathComponent(collegeComponent)
        let infoURL = baseURL.appendingPathComponent(infoComponent)
        //        let allComponents = [baseURL, versionURL, apiURL, collegeURL, infoURL]
        var components = URLComponents(url: infoURL, resolvingAgainstBaseURL: true)
        let queryValues = [URLQueryItem(name: "key", value: apiKey), URLQueryItem(name: collegeNamesKey, value: searchTerm), URLQueryItem(name: infoIDTerm, value: "\(querySet)")]
        // may need to adjust query, and change search text into Term
        
        components?.queryItems = queryValues
        
        guard let finalURL = components?.url! else {return}
        print(finalURL)
        
        
        URLSession.shared.dataTask(with: finalURL) { data, response, error in
            if let error = error {
                print("\(error.localizedDescription) Error in function \(#function)")
                completion([])
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("Country List Status Code: \(response.statusCode)")
            }
            
            guard let data = data else {completion([]) ; return}
            
            // Decoding fetched data
            
            do {
                let rootDictionary = try JSONDecoder().decode(TopLevelObject.self, from: data)
                completion(rootDictionary.secondLevelObject)
            } catch {
                print("Hey, problem in Network Call \(error)")
                completion([])
            }
        }.resume()
    }
    
    
    static func fetchImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        //1) Make the url
        let imageURL = URL(string: "https://storage.googleapis.com/resource-images/files/de33766ea46b73ef7ee5e7d3be06992c-s256.png")
        guard let campusImage = imageURL?.appendingPathComponent(urlString) else {return}
        
        //2) Make the DataTask
        URLSession.shared.dataTask(with: campusImage) { (data, _, error) in
            if let error = error {
                print(" \(error.localizedDescription) \(error) in function \(#function) ")
                completion(nil)
                return
            }
            guard let data = data else { return }
            let image = UIImage(data: data)
            completion(image)
            
        }.resume()
    }
    
    // MARK: - Account Data Controller
    
    class AccountViews {
        let name: String
        let body: String
        let bodyTwo: String
        
        init(name: String, body: String, bodyTwo: String) {
            self.name = name
            self.body = body
            self.bodyTwo = bodyTwo
        }
    }
    
    static let image =  ""
    
    
    // Use Case "WithBoldText" String values
    
    static let generalUse = "General Use".withBoldText(text: "General Use", font: nil)
    
    
    static var arrayOfAccounts: [AccountViews] {
        
        let termsOfService = AccountViews(name: "Terms Of Service", body: """
                                              College Source may make changes, update, or add or remove provisions to these Terms at any time by posting the updated Terms on applicable Services, or by notifying you via the App or any other method. By using the Services after College Source has updated the Terms, you are agreeing to all of the updated Terms; if you do not agree with any of the updated Terms, you must stop using the Services.

                                              In addition, we may, for any or no reason and at our discretion, modify, disable, or discontinue operation of the Services or your access to the Services without notice and without liability to you or any other party.  Reasons for termination may include provision of false or misleading registration information, interference with other users or the administration of our services, or violation of these Terms or any of our other policies or agreements. Upon denial of access, you agree not to attempt to access the Services.  Termination will not limit any of our other rights or remedies.  We also may limit your use of the Services, including, for example, limits on the amount of searches you make or the frequency of access.

                                              \(generalUse)

                                              The Services may not be available in all locations, and we may block access to the Services from certain locations based on your device’s geolocation information. We may add or remove the areas in which the Services are not available at any time, without notice to you.

                                              By using the Services, you represent, acknowledge and agree that you are at least 13 years of age. If you are not at least 13 years old, you may not use the Services at any time or in any manner or submit any information to the App, or any part of the Services.  If you are between the ages of 13 and 18, you may only use the Services with the approval of a parent or guardian.

                                              We may, in our sole discretion, refuse to offer the Services to any person or entity. We may, without notice and in our sole discretion, terminate your right to use the Services, or any portion thereof, and block or prevent your future access to and use of the Services or any portion thereof.

                                              Intellectual Property

                                              Subject to these Terms, College Source hereby grants you a personal, limited, non-exclusive, non-sublicensable, non-transferable and revocable license to use and to search the Materials and the Services solely for your personal, non-commercial use. Except for the foregoing license, you have no other rights in the Services or any Materials and you may not modify, edit, copy, reproduce, create derivative works of, reverse engineer, alter, enhance or in any way exploit any of the Services or Materials in any manner.

                                              Except for the limited rights expressly licensed in these Terms, College Source and its third-party licensors or suppliers retain all right, title, and interest in and to the Services.

                                              Third-Party Distribution Channels

                                              College Source offers software applications that may be made available through the Apple App Store, or other distribution channels (“Distribution Channels”). If you obtain such software through a Distribution Channel, you may be subject to additional terms of the Distribution Channel. These Terms of Service are between you and us only, and not with the Distribution Channel. To the extent that you utilize any other third-party products and services in connection with your use of our Services, you agree to comply with all applicable terms of any agreement for such third-party products and services.

                                              With respect to Software that is made available for your use in connection with an Apple®-branded product (such software, “Apple-Enabled Software”), in addition to the other terms and conditions set forth in these Terms of Service, the following terms and conditions apply:

                                              You acknowledge that these Terms are between you and College Source only, and not with Apple, Inc. (“Apple”), and that as between College Source and Apple, College Source, not Apple, is solely responsible for the Apple-Enabled Software and the content thereof.

                                              Your use of the Apple-Enabled Software must comply with Apple’s then-current App Store Terms of Service.

                                              You may not use the Apple-Enabled Software in any manner that is in violation of or inconsistent with the Usage Rules set forth for Apple-Enabled Software in, or otherwise be in conflict with, the App Store Terms of Service.

                                              You acknowledge that Apple has no obligation to provide maintenance and support services with respect to the Apple-Enabled Software. To the maximum extent permitted by applicable law, Apple will have no warranty obligation whatsoever with respect to the Apple-Enabled Software.

                                              You agree that College, and not Apple, is responsible for addressing any claims by you or any third party relating to the Apple-Enabled Software or your possession and/or use of that Apple-Enabled Software.

                                              You agree that College Source, and not Apple, shall be solely responsible, to the extent required by these Terms, for the investigation, defense, settlement and discharge of any third-party intellectual property infringement claim in the event that the Apple-Enabled Software or the end-user’s possession and use of that Apple-Enabled Software infringes that third party’s intellectual property rights.

                                              You represent and warrant that (i) you are not located in a country that is subject to a U.S. Government embargo, or that has been designated by the U.S. Government as a “terrorist supporting” country; and (ii) you are not listed on any U.S. Government list of prohibited or restricted parties.

                                              You agree to comply with all applicable third-party terms of agreement when using the Apple-Enabled Software (e.g., you must not be in violation of your wireless data service terms of agreement when using the Apple-Enabled Software).

                                              You and we agree that Apple and Apple’s subsidiaries are third-party beneficiaries to these Terms with respect to the Apple-Enabled Software. Upon your acceptance of these Terms, Apple will have the right (and will be deemed to have accepted the right) to enforce these Terms against you with respect to the Apple-Enabled Software as a third-party beneficiary thereof.

                                              If you breach any of these Terms, the above license will terminate automatically, and you must immediately stop using the Services and destroy any downloaded or printed Materials.
""", bodyTwo: "")
        let privacyPolicy = AccountViews(name: "Privacy Policy", body: """
                                             We respect your privacy and will handle your personal information pursuant to our Privacy Policy.  By using our Services, you consent to the collection and use of personal information submitted by you in accordance with our Privacy Policy.  You acknowledge that transmission of information by the Internet is never completely secure.  Except as otherwise stated in our Privacy Policy, we do not guarantee the security of any information transmitted to or from our Services, including to or from any external sites linked to our Services, and submission of any information to our Services or to any external sites linked to our Services is your risk and responsibility. Without limiting the foregoing, you expressly acknowledge that any Submissions (defined below) you submit to the Services may be viewable by all other users of the Services and any third party.
""", bodyTwo: "")
        let contact = AccountViews(name: "Contact", body: """
    Any questions or concerns may be forwarded to my buisness email
                                       ErikJimenez314@gmail.com
    If there is a problem or issue with your use of the App itself please let us know and we will look into it promptly.
""", bodyTwo: "")
        let aboutUs = AccountViews(name: "About Us", body: """
                                                  At College Source we believe that every student should have an innovative "put in your pocket" App to help them search for the college of their dreams. We make sure to emphasize resourcefulness along with creativity to bring in our new brand in modern IOS Applications for not just students but the new generation of today in it's entirety. We hope you enjoy your College Source experience in our first of many Apps to come. Inform us of any improvements you would like to see!
""", bodyTwo: "")
        let moreInformation = AccountViews(name: "More Information", body: "", bodyTwo: "")
        
        return [termsOfService, privacyPolicy, contact, aboutUs, moreInformation]
    }
}

extension String {
    func withBoldText(text: String, font: UIFont? = nil) -> NSAttributedString {
        let _font = font ?? UIFont.systemFont(ofSize: 14, weight: .regular)
        let fullString = NSMutableAttributedString(string: self, attributes: [NSAttributedString.Key.font: _font])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: _font.pointSize)]
        let range = (self as NSString).range(of: text)
        fullString.addAttributes(boldFontAttribute, range: range)
        return fullString
    }}

