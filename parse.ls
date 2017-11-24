require! <[fs js-base64]>
data = fs.read-file-sync \data .toString!split \\n
  .map -> it.trim!
  .filter -> it
  .map -> it.split ' '
  .map ->
    ret = JSON.parse(js-base64.Base64.decode(it.1))
    ret.id = it.0
    ret
  #.map -> it.answers.map -> it.value.labels or it.value
console.log data, data.length
fs.write-file-sync \questionnaire.json, JSON.stringify(data)
