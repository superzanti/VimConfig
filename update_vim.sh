# PREREQUISITES:
# Python x64
# gvim x64
# cmake x64
# Visual studio

VIMDIR=vim82
MAINDIR=`pwd`

curl https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim -o ../$VIMDIR/autoload/pathogen.vim

mkdir ../$VIMDIR/bundle

# PLUGINS
git clone https://github.com/preservim/nerdcommenter.git ../$VIMDIR/bundle/nerdcommenter
git clone https://github.com/preservim/nerdtree.git ../$VIMDIR/bundle/nerdtree
git clone https://github.com/vim-syntastic/syntastic.git ../$VIMDIR/bundle/syntastic
git clone https://github.com/godlygeek/tabular.git ../$VIMDIR/bundle/tabular
git clone https://github.com/vim-airline/vim-airline.git ../$VIMDIR/bundle/vim-airline
git clone https://github.com/tpope/vim-fugitive.git ../$VIMDIR/bundle/vim-fugitive
git clone https://github.com/airblade/vim-gitgutter.git ../$VIMDIR/bundle/vim-gitgutter
git clone https://github.com/nathanaelkane/vim-indent-guides.git ../$VIMDIR/bundle/vim-indent-guides
git clone https://github.com/honza/vim-snippets.git ../$VIMDIR/bundle/vim-snippets
git clone https://github.com/tpope/vim-surround.git ../$VIMDIR/bundle/vim-surround
git clone https://github.com/ycm-core/YouCompleteMe.git ../$VIMDIR/bundle/YouCompleteMe
cd ../$VIMDIR/bundle/YouCompleteMe
git submodule update --init --recursive
python install.py --all
cd $MAINDIR

# COLORS
curl https://raw.githubusercontent.com/w0ng/vim-hybrid/master/colors/hybrid.vim -o ../$VIMDIR/colors/hybrid.vim

# FONTS
git clone https://github.com/powerline/fonts.git ../$VIMDIR/fonts

# Source Code Pro Installation
FILES=../$VIMDIR/fonts/SourceCodePro/*
for path in $FILES.otf
do
    cp "$path" "$WINDIR\Fonts"
    file=`basename "$path"`
    name=$(echo "$file" | cut -f 1 -d '.')
    echo $file
    echo $name
    cmd //c reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" //v "$name" //t REG_SZ //d "$file" //f
done

# Copy vimrc
cp _vimrc ../_vimrc
