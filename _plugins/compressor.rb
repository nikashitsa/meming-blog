require 'uglifier'
require 'yui/compressor'
require 'image_optimizer'

Jekyll::Hooks.register :site, :post_write do |site|
  next if Jekyll.env != 'production'
  next if !site.config['compress']

  Jekyll.logger.info('Compressing js...')
  Dir[site.config['destination'] + site.config['compress']['js']].each do |path|
    compressor = Uglifier.new(output: {comments: 'none'})
    content = compressor.compile(File.read(path))
    File.open(path, 'w') do |f|
      f.write(content)
    end
  end

  Jekyll.logger.info('Compressing css...')
  Dir[site.config['destination'] + site.config['compress']['css']].each do |path|
    compressor = YUI::CssCompressor.new
    content = compressor.compress(File.read(path))
    File.open(path, 'w') do |f|
      f.write(content)
    end
  end

  Jekyll.logger.info('Optimizing images...')
  Dir[site.config['destination'] + site.config['compress']['img']].each do |path|
    ImageOptimizer.new(path, quiet: true).optimize
  end
end
