Set-StrictMode -Version Latest

# Rough Functions to Decode JSON Web Token (JWT) data in PowerShell without dependencies.

function pad64($str) { 
    if ($str.Length%4 -eq 0) { return "" } 
    else { return "=" * (4-($str.Length%4)) } 
}

function decodeJWT($strInput) { 
    $strList = $strInput.Split('.'); 
    $strList = $strList[0..($strList.Length-2)]; 
    foreach ($strPart in $strList) { 
        $strPart = $strPart.Replace('-','+').Replace('_','/') + (pad64($strPart));
        [text.encoding]::utf8.GetString([convert]::FromBase64String( $strPart ) ) 
    } 
}

# Call Like: decodeJWT -strInput "Base64url-encoded_JSON_Web_Token"

# Reference Discussion:
# - https://stackoverflow.com/questions/18677837/decoding-and-verifying-jwt-token-using-system-identitymodel-tokens-jwt

# Similar Web-Based Tool:
# - https://www.jstoolset.com/jwt
