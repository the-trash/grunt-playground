# grunt.registerTask 'minify', ['newer:uglify:all']

module.exports = (grunt) ->
  # Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-jade'

  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-concat'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-newer'

  # Project configuration
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    # CLEANUP
    clean: ["_build"]

    # SCSS
    sass:
      options:
        style: "expanded"

      dist:
        files: [
          expand: true
          cwd: "__src/stylesheets"
          src: ["**/*.css.scss"]
          dest: "_build/stylesheets"
          ext: ".css"
        ]

    # COFFEE
    coffee:
      compile:
        files: [
          cwd: "__src/javascripts"
          src: ["**/*.js.coffee"]
          dest: "_build/javascripts"
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
          cwd: "__src"
          src: ["**/*.html.jade"]
          dest: "_build"
          expand: true
          ext: ".html"
        ]

    # CONCAT
    concat:
      css:
        src: [
          '_build/stylesheets/index.css'
        ],
        dest: '_build/application.css'

      js:
        src: [
          '_build/javascripts/index.js'
        ],
        dest: '_build/application.js'

    # UGLIFY
    uglify:
      options:
        banner: '/*! <%= pkg.name %> <%= grunt.template.today(\"yyyy-mm-dd\") %> */\n'

      my_target:
        files: [
          expand: true
          cwd: "_build/javascripts"
          src: "**/*.js"
          dest: "_build/javascripts"
          ext: ".min.js"
        ]

    # WATCH AND RECOMPILE
    watch:
      coffeescript:
        files: ["__src/javascripts/**/*.js.coffee"]
        tasks: ["coffee", "concat:js"]
      scss:
        files: ["__src/stylesheets/**/*.css.scss"]
        tasks: ["sass", "concat:css"]
      jade:
        files: ["__src/**/*.html.jade"]
        tasks: ["jade"]

  # Default task(s)
  grunt.registerTask "default", [
    "clean"
    "sass"
    "coffee"
    "jade"
    "concat:css"
    "concat:js"
  ]
