var _http_status_codes:Dictionary = {
	100:["Continue","Headers recieved. Proceed to send body."],
	101:["Switching Protocols","Request to switch protocols was accepted."],
	102:["Processing","Request is being processed."],
	103:["Early Hints","Some response headers returned."],
	200:["OK","The request was successful."],
	201:["Created","New resource created."],
	202:["Accepted","Request accepted and is being processed."],
	203:["Non-Authoritative Information","Transforming proxy returning modified response."],
	204:["No Content","Request processed and no content was returned."],
	205:["Reset Content","Request processed and no content was returned. Requester should reset its document view."],
	206:["Partial Content","Part of the resource received."],
	207:["Multi-Status","The body is an XML message containing multiple response codes."],
	208:["Already Reported","Status already included in multi-status."],
	226:["IM Used","Response is a result of instance-manipulations."],
	300:["Multiple Choices","Multiple options for the resource."],
	301:["Moved Permanently","Resource has moved permanently."],
	302:["Found","Resource has moved temporarily."],
	303:["See Other","Reponse accessable at another URI."],
	304:["Not Modified","Resource has not been modified since last requested."],
	305:["Use Proxy","Only available through a proxy."],
	307:["Temporary Redirect","Resource has moved temporarily. Not changing method."],
	308:["Permanent Redirect","Resource has moved permanently. Not changing method."],
	400:["Bad Request","Can\'t or wont proccess due to a client error."],
	401:["Unauthorized","No authentication information provided."],
	402:["Payment Required","Payment is required to access this resource."],
	403:["Forbidden","Server is refusing to process the request."],
	404:["Not Found","Resource could not be found."],
	405:["Method Not Allowed","Method used is not allowed."],
	406:["Not Acceptable","Can\'tan acceptable resource type."],
	407:["Proxy Authentication Required","Authentication with proxy required."],
	408:["Request Timeout","Server timed out waiting for the request."],
	409:["Conflict","Conflict in the resource\'s current state."],
	410:["Gone","Resource is not longer available."],
	411:["Length Required","Content length must be specified."],
	412:["Precondition Failed","Server does not meet a requested precondition."],
	413:["Payload Too Large","Request is too large for the server to process."],
	414:["URI Too Long","URI is too long for the server to process."],
	415:["Unsupported Media Type","The media type provided is not supported."],
	416:["Range Not Satisfiable","Server cannot supply specified portion of the file."],
	417:["Expectation Failed","Server doesn\'t meet the the requirements of the Expect header field."],
	421:["Misdirected Request","Server redirected to can\'t produce a response."],
	422:["Unprocessable Entity","Request is valid but is unable to be followed due to semantic errors."],
	423:["Locked","Requested resource is locked."],
	424:["Failed Dependency","Dependent request has failed."],
	425:["Too Early","Server is unwilling to process a request that may be replayed."],
	426:["Upgrade Required","Client should switch protocols."],
	428:["Precondition Required","Server required a conditional request."],
	429:["Too Many Requests","Too many requests are being sent."],
	431:["Request Header Fields Too Large","One or all header fields are too large."],
	451:["Unavailable for Legal Reasons","Resource unavailable due to a legal demand."],
	500:["Internal Server Error","Server encountered an error and more info is unavailable."],
	501:["Not Implemented","Server doesn\'t recognize the method or can\'t fulfil the request."],
	502:["Bad Gateway","Invalid response from the upstream server."],
	503:["Service Unavailable","Server can\'t handle the request."],
	504:["Gateway Timeout","Response not received from the upstream server in time."],
	505:["HTTP Version Not Supported","Server doesn\'t support the requested HTTP version."],
	506:["Variant Also Negotiates","Circular reference."],
	507:["Insufficient Storage","Insufficient storage space on the server."],
	508:["Loop Detected","Infinite loop while processing the request."],
	510:["Not Extended","Extensions to the request are required."],
	511:["Network Authentication Required","Client needs to authenticate to for network access."]
}

func http_status_text(_code:int) -> String:
	if _http_status_codes.has(_code):
		return _http_status_codes[_code][0]
	return "Unknown status code"

func http_status_category(_code:int) -> String:
	if _code in range(100,199):return "Informational"
	elif _code in range(200,299):return "Success"
	elif _code in range(300,399):return "Redirection"
	elif _code in range(400,499):return "Client error"
	elif _code in range(500,599):return "Server error"
	else:return "Unknown status code"

func http_status_description(_code:int) -> String:
	if _http_status_codes.has(_code):
		return _http_status_codes[_code][1]
	return "Unknown status code"
