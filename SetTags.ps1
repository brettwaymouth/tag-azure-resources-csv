$resources = Import-Csv -Path "C:\deploy\data.csv"    

foreach ($resource in $resources)
{
    $ResourceID = $resource.'ResourceId'
    $ApplicationTag = $resource.'ApplicationTag'
    $CompanyTag = $resource.'CompanyTag' 
    $EnvironmentTag = $resource.'EnvironmentTag'
                        
    Set-AzResource -ResourceID $ResourceID -Tag @{} -Force
    Set-AzResource -ResourceID $ResourceID -Tag @{Application=$ApplicationTag;Company=$CompanyTag;Environment=$EnvironmentTag} -force        
}