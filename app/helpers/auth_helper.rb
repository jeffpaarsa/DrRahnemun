module AuthHelper

	def getSecurityToken

		response = HTTParty.post("https://prowand.allscriptscloud.com:5004/UnityService.svc/Unityservice",
    		:body => '<?xml version="1.0" encoding="utf-8"?><s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"><s:Body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><GetSecurityToken xmlns="http://www.allscripts.com/Unity"><Username>72088:TheW1zard</Username><Password>5WhenIzV2</Password></GetSecurityToken></s:Body></s:Envelope>',
    		:headers => {
    			"Host" => "prowand.allscriptscloud.com:5004",
    			"Content-Type" => "text/xml; charset=utf-8",
    			"SOAPAction" => "http://www.allscripts.com/Unity/IUnityService/GetSecurityToken"
    		},
    		:verify => false 
    	)

		return response.parsed_response["Envelope"]["Body"]["GetSecurityTokenResponse"]["GetSecurityTokenResult"]

	end

	def getUserAuthentication(username, password, token)

		body = '<?xml version="1.0" encoding="utf-8"?><s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"><s:Body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Magic xmlns="http://www.allscripts.com/Unity"><Action>GetUserAuthentication</Action><UserID>' + username + '</UserID><Appname>WandPro</Appname><PatientID></PatientID><Token>' + token + '</Token><Parameter1>' + password + '</Parameter1><Parameter2></Parameter2><Parameter3>1.3.00</Parameter3><Parameter4></Parameter4><Parameter5></Parameter5><Parameter6></Parameter6><Data></Data></Magic></s:Body></s:Envelope>'
		response = HTTParty.post("https://prowand.allscriptscloud.com:5004/UnityService.svc/Unityservice",
    		:body => body,
    		:headers => {
    			"Host" => "prowand.allscriptscloud.com:5004",
    			"Content-Type" => "text/xml; charset=utf-8",
    			"SOAPAction" => "http://www.allscripts.com/Unity/IUnityService/Magic"
    		},
    		:verify => false 
    	)

		return response.parsed_response # ["Envelope"]["Body"]["MagicResponse"]["MagicResult"]["diffgram"]["getuserauthenticationresponse"]["getuserauthenticationinfo"]["ClientID"]

	end

    def checkWombatSecurity(username, token)

        body = '<?xml version="1.0" encoding="utf-8"?><s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"><s:Body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Magic xmlns="http://www.allscripts.com/Unity"><Action>CheckWombatSecurity</Action><UserID>' + username + '</UserID><Appname>WandPro</Appname><PatientID></PatientID><Token>' + token + '</Token><Parameter1></Parameter1><Parameter2></Parameter2><Parameter3></Parameter3><Parameter4></Parameter4><Parameter5></Parameter5><Parameter6></Parameter6><Data></Data></Magic></s:Body></s:Envelope>'
        response = HTTParty.post("https://prowand.allscriptscloud.com:5004/UnityService.svc/Unityservice",
            :body => body,
            :headers => {
                "Host" => "prowand.allscriptscloud.com:5004",
                "Content-Type" => "text/xml; charset=utf-8",
                "SOAPAction" => "http://www.allscripts.com/Unity/IUnityService/Magic"
            },
            :verify => false 
        )

        return response.parsed_response

    end

    def getObjectsWithNoDetail(username, token)

        body = '<?xml version="1.0" encoding="utf-8"?><s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"><s:Body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Magic xmlns="http://www.allscripts.com/Unity"><Action>GetObjectsWithNoDetail</Action><UserID>' + username + '</UserID><Appname>WandPro</Appname><PatientID></PatientID><Token>' + token + '</Token><Parameter1></Parameter1><Parameter2></Parameter2><Parameter3></Parameter3><Parameter4></Parameter4><Parameter5></Parameter5><Parameter6></Parameter6><Data></Data></Magic></s:Body></s:Envelope>'
        response = HTTParty.post("https://prowand.allscriptscloud.com:5004/UnityService.svc/Unityservice",
            :body => body,
            :headers => {
                "Host" => "prowand.allscriptscloud.com:5004",
                "Content-Type" => "text/xml; charset=utf-8",
                "SOAPAction" => "http://www.allscripts.com/Unity/IUnityService/Magic"
            },
            :verify => false 
        )

        return response.parsed_response

    end
end
