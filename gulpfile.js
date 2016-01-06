var gulp        = require('gulp');
var browserSync = require('browser-sync').create();
var rev = require('gulp-rev');
var revManifest = require('gulp-rev-manifest');
var fingerprint = require('gulp-fingerprint');
//var manifest = require('../rev-manifest.json');

// Static server
gulp.task('bs-server', function() {
	var files = [
		'css/*.css',
		'js/*.js',
		'static/*.html'
	];
	browserSync.init({
		files: files,
		server: {
			baseDir: "./"
		}
	});
});

// Proxy
gulp.task('bs-proxy', function() {
	browserSync.init({
		files: ['pages/**', 'css/*.css', 'js/*.js', 'utilities/**'],
		proxy: 'localhost/ma.wroc.pl'
	});
});

// Autoversioning
gulp.task('new-version', function() {

	return gulp.src('css/*.css')
	.pipe(rev())
	.pipe(gulp.dest('test'))
	.pipe(rev.manifest())
	.pipe(gulp.dest('./'));
});