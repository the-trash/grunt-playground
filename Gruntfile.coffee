# grunt.registerTask 'minify', ['newer:uglify:all']

module.exports = (grunt) ->
  # Load the plugins
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.loadNpmTasks 'grunt-contrib-jade'

  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-concat'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-newer'

  # Project configuration
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    # CLEANUP
    clean: ["build"]

    # SCSS
    sass:
      options:
        style: "expanded"

      dist:
        files: [
          expand: true
          cwd: "_src/assets/css"
          src: ["**/*.css.scss"]
          dest: "build/assets/css"
          ext: ".css"
        ]

    # COFFEE
    coffee:
      compile:
        files: [
          cwd: "_src/assets/js"
          src: ["**/*.js.coffee"]
          dest: "build/assets/js"
          expand: true
          ext: ".js"
        ]

    # JADE
    jade:
      compile:
        options:
          client: false
          pretty: true

        files: [
          cwd: "_src"
          src: ["**/*.html.jade"]
          dest: "build"
          expand: true
          ext: ".html"
        ]

    # CONCAT + MANIFESTO
    concat:
      css:
        src: [
          'build/assets/css/index.css'
        ],
        dest: 'build/assets/css/application.css'

      js:
        src: [
          'build/assets/js/index.js'
        ],
        dest: 'build/assets/js/application.js'

    # COPY
    copy:
      main:
        files: [
          expand: true
          cwd: '_src/assets/imgs'
          src: ['*']
          dest: 'build/assets/imgs'
        ]

    # CSS MIN
    cssmin:
      app:
        files: [
          src:  "build/assets/css/application.css"
          dest: "build/assets/css/application.min.css"
        ]

    # UGLIFY
    uglify:
      app:
        options:
          banner: '/*! <%= pkg.name %> App: <%= grunt.template.today(\"yyyy-mm-dd\") %> */\n'
        files: [
          src:  "build/assets/js/application.js"
          dest: "build/assets/js/application.min.js"
        ]

    # WATCH NEW AND RECOMPILE
    watch:
      coffeescript:
        files: ["_src/assets/js/**/*.js.coffee"]
        tasks: ["coffee", "concat:js", "uglify:app"]
      scss:
        files: ["_src/assets/css/**/*.css.scss"]
        tasks: ["sass", "concat:css", "cssmin:app"]
      jade:
        files: ["_src/**/*.html.jade"]
        tasks: ["jade"]

  # Default task(s)
  grunt.registerTask "default", [
    "clean"

    "sass"
    "coffee"
    "jade"

    "copy:main"

    "concat:css"
    "concat:js"

    "cssmin:app"
    "uglify:app"
  ]
