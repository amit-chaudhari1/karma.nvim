" clear cache so this reloads changes.
" useful for development
" lua package.loaded['karma'] = nil
" lua package.loaded['karma.theme'] = nil
" lua package.loaded['karma.colors'] = nil
" lua package.loaded['karma.util'] = nil
lua package.loaded['karma.config'] = nil

lua require('karma').colorscheme()
