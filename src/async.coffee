# async.coffee, smd-js/src/
fs = require 'fs'


read_file = (file_path) ->
  new Promise (resolve, reject) ->
    fs.readFile file_path, 'utf8', (err, data) ->
      if err
        reject err
      else
        resolve data

write_file = (file_path, text) ->
  new Promise (resolve, reject) ->
    fs.writeFile file_path, text, 'utf8', (err) ->
      if err
        reject err
      else
        resolve()

# move file
mv = (from, to) ->
  new Promise (resolve, reject) ->
    fs.rename from, to, (err) ->
      if err
        reject err
      else
        resolve()


module.exports = {
  read_file  # async
  write_file  # async
  mv  # async
}
