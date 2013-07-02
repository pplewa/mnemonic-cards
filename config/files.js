/* Exports an object that defines
 *  all of the paths & globs that the project
 *  is concerned with.
 *
 * The "configure" task will require this file and
 *  then re-initialize the grunt config such that
 *  directives like <config:files.js.app> will work
 *  regardless of the point you're at in the build
 *  lifecycle.
 *
 * You can find the parent object in: node_modules/lineman/config/files.coffee
 */

module.exports = require(process.env['LINEMAN_MAIN']).config.extend('files', {
  coffee: {
    app: [
      "app/js/namespace.coffee",
      "app/js/Models/**/*.coffee",
      "app/js/Collections/**/*.coffee",
      "app/js/Views/**/*.coffee",
      "app/js/Routers/**/*.coffee",
      "app/js/app.coffee",
      "app/js/**/*.coffee"
    ]
  },
  js: {
    vendor: [
      "vendor/js/jquery.js",
      "vendor/js/underscore.js",
      "vendor/js/backbone.js",
      "vendor/js/backbone.localStorage.js",
      "vendor/js/**/*.js"
    ]
  },
  template: {
    homepage: "app/templates/MainView.us"
  }
});
