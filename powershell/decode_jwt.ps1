Set-StrictMode -Version Latest

# Rough Functions to Decode JSON Web Token (JWT) data in PowerShell without dependencies.

function pad64($str) { 
    # Return "=" padding string for Base64 encoding even multiple of 4.
    $strLenMod4 = $str.Length % 4;
    if ($strLenMod4 -eq 0) { return "" } 
    else { return "=" * (4-$strLenMod4) } 
}

function decodeJWT($strInput) { 
    # Split out Headers, Claims, and Signature parts
    $strList = $strInput.Split('.'); 
    
    # Ignore the Binary Signature Part (last item in list)
    $strList = $strList[0..($strList.Length-2)]; 
    foreach ($strPart in $strList) { 
       
        # Convert from base64url to base64 (standard) special characters + padding.
        $strPart = $strPart.Replace('-','+').Replace('_','/') + (pad64($strPart));
        [text.encoding]::utf8.GetString([convert]::FromBase64String( $strPart ) ) 
    } 
}

# Call Like: decodeJWT -strInput "Base64url-encoded_JSON_Web_Token"

# Reference Discussion:
# - https://stackoverflow.com/questions/18677837/decoding-and-verifying-jwt-token-using-system-identitymodel-tokens-jwt

# Similar Web-Based Tool:
# - https://www.jstoolset.com/jwt

# Reference base64url encoding and padding:
# - https://en.wikipedia.org/wiki/Base64
