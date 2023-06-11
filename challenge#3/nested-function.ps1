function Get-NestedObjectValue {
    param (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        $Object,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        $Key
    )

    $KeyParts = $Key -split '/'

    foreach ($Part in $KeyParts) {
        if ($Object -is [System.Collections.IDictionary]) {
            if ($Object.ContainsKey($Part)) {
                $Object = $Object[$Part]
            }
            else {
                throw "Key '$Key' not found in the object."
            }
        }
        else {
            throw "Object type not supported. Only dictionaries are supported."
        }
    }

    return $Object
}