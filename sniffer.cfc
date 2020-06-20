<cfcomponent>
    <cffunction
        access="public"
        name="getBrowserDetails"
        returnType="struct"
    >
        <cfscript>
            debug = false;
            useragent = getHTTPRequestData().headers["User-Agent"];
            parsed = REFind("[A-Za-z]*\/[0-9.]*",useragent,1,true, "all");
            obj = structNew();
            result = structNew();

            //Creating a structure of key/value pairs for browser and version
            for(i = 1; i<=arrayLen(parsed); i=i+1){
                obj["#Lcase(parsed[i].match[1].split("/")[1])#"] = "#parsed[i].match[1].split("/")[2]#";
            }

            //Checking browser
            //https://developer.mozilla.org/en-US/docs/Web/HTTP/Browser_detection_using_the_user_agent
            if(findNoCase("firefox", useragent) && !findNoCase("seamonkey", useragent)){
                result["browser"] = "Firefox";
                result["version"] = obj.firefox;
            }
            else if(findNoCase("seamonkey", useragent)){
                result["browser"] = "SeaMonkey";
                result["version"] = obj.seamonkey;
            }
            else if(findNoCase("OPR/", useragent)){
                result["browser"] = "Opera";
                result["version"] = obj.opr;
            }
            else if(findNoCase("opera/", useragent)){
                result["browser"] = "Opera";
                result["version"] = obj.opera;
            }
            else if(findNoCase("chrome", useragent) && !findNoCase("chromium", useragent) && !findNoCase("Edg/", useragent)){
                result["browser"] = "Chrome";
                result["version"] = obj.chrome;
            }
            else if(findNoCase("Edg/", useragent) && !findNoCase("chromium", useragent)){
                result["browser"] = "Edge";
                result["version"] = obj.edg;
            }
            else if(findNoCase("chromium", useragent)){
                result["browser"] = "Chromium";
                result["version"] = obj.chromium;
            }
            else if(findNoCase("safari", useragent) && !findNoCase("chrome", useragent) && !findNoCase("chromium", useragent)){
                result["browser"] = "Safari";
                result["version"] = obj.safari;
            }
            else if(findNoCase("trident", useragent)){
                result["browser"] = "Internet Explorer";
                result["version"] = obj.trident;
            }
            else{
                result["browser"] = "Unknown";
                result["version"] = 0;
            }

            if(debug){
                writeDump(useragent);
                writeDump(obj)
            }

        </cfscript>
        <cfreturn result >
    </cffunction>
</cfcomponent>
