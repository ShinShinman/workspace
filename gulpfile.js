var gulp = require('gulp');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');
var autoprefixer = require('gulp-autoprefixer');
var cleanCss = require('gulp-clean-css');
var rename = require('gulp-rename');
var coffee = require('gulp-coffee');
var browserSync = require('browser-sync').create();
var include = require('gulp-include');
var uglyfly = require('gulp-uglyfly');
var rev = require('gulp-rev');
var revReplace = require('gulp-rev-replace');

gulp.task('sass', function() {
	return gulp.src('scss/main.scss')
		.pipe(sourcemaps.init())
		.pipe(sass({
			includePaths: ['./bower_components', './npm_modules']
		}).on('error', sass.logError))
		.pipe(autoprefixer())
		//.pipe(cleanCss())
		.pipe(sourcemaps.write('./'))
		.pipe(gulp.dest('./css/'))
		/*
		.pipe(browserSync.reload({
			stream: true
		}));
		*/
});

gulp.task('minifyCss', function() {
	return gulp.src('css/main.css')
	.pipe(sourcemaps.init())
	.pipe(cleanCss())
	.pipe(rename({
		suffix: '.min'
	}))
	.pipe(sourcemaps.write('./'))
	.pipe(gulp.dest('./css/'))
	.pipe(browserSync.reload({
		stream: true
	}));
});

gulp.task('revision', function() {
	return gulp.src('./css/main.css')
		.pipe(rev())
		.pipe(gulp.dest('./css/'))
		.pipe(rev.manifest({
			merge: true
		}))
		.pipe(gulp.dest('./'));
});

gulp.task('revision-js', function() {
	return gulp.src('./js/main.min.js')
		.pipe(rev())
		.pipe(gulp.dest('./js/'))
		.pipe(rev.manifest({
			merge: true
		}))
		.pipe(gulp.dest('./'));
});

gulp.task('revreplace', ['revision'], function() {
	var manifest = gulp.src('./rev-manifest.json');
	return gulp.src('./utilities/master.xsl.html')
		.pipe(revReplace({manifest: manifest}))
		.pipe(rename({
			suffix: '-dist'
		}))
		.pipe(gulp.dest('./utilities/'));
});

gulp.task('coffee', function() {
	return gulp.src('coffee/ma.coffee')
	.pipe(sourcemaps.init())
	.pipe(coffee().on('error', console.log))
	.pipe(sourcemaps.write('./'))
	.pipe(gulp.dest('coffee/js/'))
	/*
	.pipe(browserSync.reload({
		stream: true
	}));
	*/
});

gulp.task('scripts', function() {
	return gulp.src('coffee/components4gulp.js')
	.pipe(sourcemaps.init())
	.pipe(include()).on('error', console.log)
	.pipe(uglyfly())
	.pipe(rename('main.min.js'))
	.pipe(sourcemaps.write('./'))
	.pipe(gulp.dest('./js/'))
	.pipe(browserSync.reload({
		stream: true
	}));
});

gulp.task('browserSync', function(){
	browserSync.init({
		proxy: 'localhost/ma.wroc.pl/'
	});
});

gulp.task('default', ['browserSync', 'sass'], function() {
    gulp.watch('scss/**/*.scss', ['sass']);
    gulp.watch('css/**/*.css', ['minifyCss']);
    gulp.watch('coffee/**/*.coffee', ['coffee']);
    gulp.watch('coffee/js/*.js', ['scripts']);
    gulp.watch('index.html', browserSync.reload);
});
