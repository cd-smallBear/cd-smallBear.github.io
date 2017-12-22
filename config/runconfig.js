var fs = require('fs'),
    gulp = require('gulp'),
    sass = require('gulp-sass'),
    // cssshrink = require('gulp-cssshrink'),
    // rename = require('gulp-rename'),
    autoprefixer = require('gulp-autoprefixer'),
    csscomb = require('gulp-clean-css'),
    spritesmith = require('gulp.spritesmith'),
    // concat = require('gulp-concat'),
    swig = require('gulp-swig'),
    browserSync = require('browser-sync').create('cms'),

    sassOptions = {},
    prefixerOptions = {browsers: ['ff >= 20', 'ie >= 9']}, // '> 5%'
    swigOptions = require( './swigOptions' ),
    sprites = require('./sprites.js'),

    utils = require( './util' )

module.exports = ( devPath, buildPath, distPath )=> {
  // server option
  var serverOptions = require( './serverOptions' )(buildPath),
      {getPath, deleteFolderRecursive} = utils( devPath, buildPath )

  // -----编译任务
  /**
   * sass编译
   * @method sass
   * @param  {string} src 编译对象
   * @return {gulp.stream}       gulp数据流
   */
  function gulpSass( src ) {
    var pathOb = getPath( src, buildPath + '/css', devPath + '/scss/**/*.scss' )
    return gulp.src( pathOb.src )
      .pipe( sass( sassOptions ))
      .pipe( csscomb(  ))
      .pipe( gulp.dest( pathOb.build ) )
      .pipe( browserSync.reload({stream: true}) )
  }
  gulp.task( 'sass', ()=> {
    return gulpSass()
  })

  gulp.task( 'css', ['sass'], ()=> {
    return gulp.src( devPath + '/css/**/*.css' )
      .pipe( autoprefixer(prefixerOptions) ) // 兼容
      // .pipe( cssshrink() )  // 去除重复
      .pipe(csscomb())
      .pipe( gulp.dest( buildPath + '/css' ) )
  })
  /**
   * 编译 swig
   * @method gulpSwig
   * @param  {string} src 编译对象
   * @return {gulp.stream}       gulp数据流
   */
  function gulpSwig( src ) {
    var pathOb = getPath( src, buildPath + '', devPath + '/swig/html/**/*.swig')

    console.log( 'swig: ', pathOb.build )
    return gulp.src( pathOb.src )
      .pipe( swig( swigOptions ) )
      .pipe( gulp.dest( pathOb.build ) )
      .pipe( browserSync.reload({stream : true})  )
  }
  gulp.task( 'swig', ()=> {
    return gulpSwig()
  })

  /**
   * 编译 js
   * @method gulpJs
   * @param  {string} src        编译对象
   * @return {gulp.stream}       gulp数据流
   */
  function gulpJs( src ) {
    var pathOb = getPath( src, buildPath + '/js', devPath + '/js/**/*.js' )

    return gulp.src( pathOb.src )
      .pipe( gulp.dest( pathOb.build ) )
      .pipe( browserSync.reload({stream: true}) )
  }
  gulp.task( 'js', ()=> {
    deleteFolderRecursive( buildPath + '/js' )

    return gulpJs()
  })

  /**
   * 生成雪碧图
   * @method gulpSprite
   * @param  {[type]}   name [description]
   * @return {string} (scss路径)
   */
  function gulpSprite( name ) {
    deleteFolderRecursive( devPath + '/scss/sprites' )

    var smithTar = gulp.src( devPath + '/images/sprites/'+name+'/*.png')
          .pipe( spritesmith(
            {
              cssOpts: {functions: false},
              imgName: name+'_sprite.png',
              cssName: '_' + name + '.scss',
              imagePath: '../images/',
              cssTemplate: './config/template.scss.handlebars',
            }
          ) )

    smithTar.img.pipe( gulp.dest( buildPath + '/images') )
    smithTar.css.pipe( gulp.dest( devPath + '/scss/sprites') )

    return 'sprites/' + name
  }
  gulp.task( 'sprites', ()=> {
    deleteFolderRecursive( devPath + '/scss/sprites' )

    var _paths = []
    sprites.forEach((el, ix)=> {
      _paths.push( '@import "' + gulpSprite( el ) + '";\n' )
    })

    fs.writeFile( devPath + '/scss/_sprites.scss', _paths.join(''), (error)=> {
      console.warn( 'file success!', error )
    })
  }),
  gulp.task( 'copy', ()=> {
       gulp.src(devPath + '/fonts/*')
      .pipe( gulp.dest(buildPath + '/fonts') )

    return gulp.src(devPath + '/images/**/*')
      .pipe( gulp.dest(buildPath + '/images') )
  })
  gulp.task( 'build', ['css', 'swig', 'js', 'copy'])


  // -----查看文件变动任务
  gulp.task( 'watchSass', ()=> {
    return gulp.watch( devPath + '/scss/**/*.scss', (evt)=> {
      var _path = evt.path

      if( /(\/|\\)_(\w+)/.test( _path ) ) {
        return gulpSass()
      }else return gulpSass( _path )
    } )
  })
  gulp.task( 'watchSwig', ()=> {
    return gulp.watch( devPath + '/swig/**/*.swig', (evt)=> {
      var _path = evt.path

      if( /(\/|\\)_(\w+)/.test( _path ) ) {
        return gulpSwig()
      }else return gulpSwig( _path )
    })
  })
  gulp.task( 'watchJs', ()=> {
    return gulp.watch( devPath+'/js/**/*.js', (evt)=> {
      return gulpJs( evt.path )
    })
  })

  // ----server
  gulp.task( 'server', ['watchSass', 'watchSwig', 'watchJs'], ()=> {
    browserSync.init( serverOptions )
  } )

    gulp.task("smallbear",function(){

            browserSync.init( {
                // proxy:"http://192.168.2.200:9000/",
                server: {
                    baseDir: buildPath,
                    index: "/login/login.html"
                },
                port:999,
                // online:false,
                // open: "external",
                open:"tunnel",
                notify: false,
                logPrefix: "smallBear",
                logLevel: "info",
                tunnel:"smallbear",
                ghostMode: {
                    clicks: false,
                    forms: false,
                    scroll: false
                }
            } )
    })
}
