module.exports =
  app:
    options:
      bare: false
    expand: true
    cwd: './src/'
    src: ['**/*.ls']
    dest: 'dist/'
    rename:  (dest, src) ->
      folder = src.substring 0, src.lastIndexOf('/')
      filename = src.substring src.lastIndexOf('/'), src.length
      filename = filename.substring 0, filename.lastIndexOf('.')
      
      if dest.slice(-1) isnt '/'
        dest += '/'
      dest + folder + filename + '.js'
