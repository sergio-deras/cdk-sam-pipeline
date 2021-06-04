counter=1
while [ $counter -le 15 ]
do
    aws lambda invoke --function-name --profile <profile>  \
    $(aws lambda list-functions --profile <profile>  | jq -r -c '.Functions[] | select( .FunctionName | contains("sam-app2-HelloWorldFunction")).FunctionName'):live \
    --payload '{}' \
    response.json
    sleep 1
    ((counter++))
done