module PatientHelper

	def searchPatients(username, token, search)

        body = '<?xml version="1.0" encoding="utf-8"?><s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"><s:Body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Magic xmlns="http://www.allscripts.com/Unity"><Action>SearchPatients</Action><UserID>' + username + '</UserID><Appname>WandPro</Appname><PatientID></PatientID><Token>' + token + '</Token><Parameter1>' + search + '</Parameter1><Parameter2></Parameter2><Parameter3></Parameter3><Parameter4></Parameter4><Parameter5></Parameter5><Parameter6></Parameter6><Data></Data></Magic></s:Body></s:Envelope>'
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

    def getDocuments(username, token, patientID)

        body = '<?xml version="1.0" encoding="utf-8"?><s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"><s:Body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Magic xmlns="http://www.allscripts.com/Unity"><Action>GetDocuments</Action><UserID>' + username + '</UserID><Appname>WandPro</Appname><PatientID>' + patientID + '</PatientID><Token>' + token + '</Token><Parameter1></Parameter1><Parameter2></Parameter2><Parameter3></Parameter3><Parameter4></Parameter4><Parameter5></Parameter5><Parameter6></Parameter6><Data></Data></Magic></s:Body></s:Envelope>'
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

    def getDocumentImage(username, token, patientID, documentID, documentType, outputType)

        body = '<?xml version="1.0" encoding="utf-8"?><s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"><s:Body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Magic xmlns="http://www.allscripts.com/Unity"><Action>GetDocumentImage</Action><UserID>' + username + '</UserID><Appname>WandPro</Appname><PatientID>' + patientID + '</PatientID><Token>' + token + '</Token><Parameter1>' + documentID + '</Parameter1><Parameter2>' + documentType + '</Parameter2><Parameter3>' + outputType + '</Parameter3><Parameter4></Parameter4><Parameter5></Parameter5><Parameter6></Parameter6><Data></Data></Magic></s:Body></s:Envelope>'
        
        response = HTTParty.post("https://prowand.allscriptscloud.com:5004/UnityService.svc/Unityservice",
            :body => body,
            :headers => {
                "Host" => "prowand.allscriptscloud.com:5004",
                "Content-Type" => "text/xml; charset=utf-8",
                "SOAPAction" => "http://www.allscripts.com/Unity/IUnityService/Magic"
            },
            :verify => false 
        )

        displayName = response.parsed_response["Envelope"]["Body"]["MagicResponse"]["MagicResult"]["diffgram"]["getdocumentimageresponse"]["getdocumentimageinfo"]["DisplayName"]
        fileName = documentID + "." + outputType
        File.open(fileName, 'wb') do|f|
        	f.write(Base64.decode64(response.parsed_response["Envelope"]["Body"]["MagicResponse"]["MagicResult"]["diffgram"]["getdocumentimageresponse"]["getdocumentimageinfo"]["DocumentImage"]))
        end

    end

    def saveDocumentImage(username, token, patientID, documentID, documentType, outputType)

        body = '<?xml version="1.0" encoding="utf-8"?><s:Envelope xmlns:s="http://schemas.xmlsoap.org/soap/envelope/"><s:Body xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"><Magic xmlns="http://www.allscripts.com/Unity"><Action>SaveDocumentImage</Action><UserID>' + username + '</UserID><Appname>WandPro</Appname><PatientID>' + patientID + '</PatientID><Token>' + token + '</Token><Parameter1>' + documentID + '</Parameter1><Parameter2>' + documentType + '</Parameter2><Parameter3>' + outputType + '</Parameter3><Parameter4></Parameter4><Parameter5></Parameter5><Parameter6></Parameter6><Data></Data></Magic></s:Body></s:Envelope>'
        
        response = HTTParty.post("https://prowand.allscriptscloud.com:5004/UnityService.svc/Unityservice",
            :body => body,
            :headers => {
                "Host" => "prowand.allscriptscloud.com:5004",
                "Content-Type" => "text/xml; charset=utf-8",
                "SOAPAction" => "http://www.allscripts.com/Unity/IUnityService/Magic"
            },
            :verify => false 
        )

        displayName = response.parsed_response["Envelope"]["Body"]["MagicResponse"]["MagicResult"]["diffgram"]["getdocumentimageresponse"]["getdocumentimageinfo"]["DisplayName"]
        fileName = documentID + "." + outputType
        File.open(fileName, 'wb') do|f|
        	f.write(Base64.decode64(response.parsed_response["Envelope"]["Body"]["MagicResponse"]["MagicResult"]["diffgram"]["getdocumentimageresponse"]["getdocumentimageinfo"]["DocumentImage"]))
        end

    end
end
