isengardcli assume racliu+ug2020

deploySamLambda () {
  SAM_Bucket=sam-522303534324-sydney
  functionName=$1
  rm -rf output/$functionName.output.yml
  sam build -t $functionName.yml --parameter-overrides functionName=$functionName
  sam package --s3-bucket $SAM_Bucket --output-template-file output/$functionName.output.yml
  sam deploy --force-upload true --template-file output/$functionName.output.yml --stack-name $functionName --capabilities CAPABILITY_NAMED_IAM --parameter-overrides functionName=$functionName
}

deploySamLambda sam-lambda-skill-checkbus









