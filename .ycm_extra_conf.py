import os
import os.path
import fnmatch
import logging
import ycm_core
import subprocess

BASE_FLAGS = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-ferror-limit=10000',
    '-DNDEBUG',
    '-std=c++11',
    '-xc++',
    '-I/usr/lib/'
    '-I/usr/include/',
    '-D_REENTRANT -I/usr/local/Cellar/gtkmm3/3.18.0/include/gtkmm-3.0 -I/usr/local/Cellar/gtkmm3/3.18.0/lib/gtkmm-3.0/include -I/usr/local/Cellar/atkmm/2.24.2/include/atkmm-1.6 -I/usr/local/Cellar/gtk+3/3.18.9/include/gtk-3.0/unix-print -I/usr/local/Cellar/gtkmm3/3.18.0/include/gdkmm-3.0 -I/usr/local/Cellar/gtkmm3/3.18.0/lib/gdkmm-3.0/include -I/usr/local/Cellar/glibmm/2.46.3/include/giomm-2.4 -I/usr/local/Cellar/glibmm/2.46.3/lib/giomm-2.4/include -I/usr/local/Cellar/pangomm/2.38.1/include/pangomm-1.4 -I/usr/local/Cellar/pangomm/2.38.1/lib/pangomm-1.4/include -I/usr/local/Cellar/glibmm/2.46.3/include/glibmm-2.4 -I/usr/local/Cellar/glibmm/2.46.3/lib/glibmm-2.4/include -I/usr/local/Cellar/gtk+3/3.18.9/include/gtk-3.0 -I/usr/local/Cellar/glib/2.46.2/include/gio-unix-2.0/ -I/usr/local/Cellar/cairo/1.14.6_1/include/cairo -I/usr/local/Cellar/libepoxy/1.3.1/include -I/usr/local/Cellar/pango/1.38.1/include/pango-1.0 -I/usr/local/Cellar/harfbuzz/1.2.7/include/harfbuzz -I/usr/local/Cellar/pango/1.38.1/include/pango-1.0 -I/usr/local/Cellar/atk/2.18.0_1/include/atk-1.0 -I/usr/local/Cellar/cairo/1.14.6_1/include/cairo -I/usr/local/Cellar/cairomm/1.12.0/include/cairomm-1.0 -I/usr/local/Cellar/cairomm/1.12.0/lib/cairomm-1.0/include -I/usr/local/Cellar/cairo/1.14.6_1/include/cairo -I/usr/local/Cellar/pixman/0.34.0/include/pixman-1 -I/usr/local/Cellar/fontconfig/2.11.1_2/include -I/usr/local/Cellar/freetype/2.6.3/include/freetype2 -I/usr/local/Cellar/libpng/1.6.23/include/libpng16 -I/usr/local/Cellar/libsigc++/2.8.0/include/sigc++-2.0 -I/usr/local/Cellar/libsigc++/2.8.0/lib/sigc++-2.0/include -I/usr/local/Cellar/gdk-pixbuf/2.32.3/include/gdk-pixbuf-2.0 -I/usr/local/Cellar/libpng/1.6.23/include/libpng16 -I/usr/local/Cellar/glib/2.46.2/include/glib-2.0 -I/usr/local/Cellar/glib/2.46.2/lib/glib-2.0/include -I/usr/local/opt/gettext/include -L/usr/local/Cellar/gtkmm3/3.18.0/lib -L/usr/local/Cellar/atkmm/2.24.2/lib -L/usr/local/Cellar/gtkmm3/3.18.0/lib -L/usr/local/Cellar/glibmm/2.46.3/lib -L/usr/local/Cellar/pangomm/2.38.1/lib -L/usr/local/Cellar/glibmm/2.46.3/lib -L/usr/local/Cellar/gtk+3/3.18.9/lib -L/usr/local/Cellar/pango/1.38.1/lib -L/usr/local/Cellar/atk/2.18.0_1/lib -L/usr/local/Cellar/cairo/1.14.6_1/lib -L/usr/local/Cellar/glib/2.46.2/lib -L/usr/local/Cellar/cairomm/1.12.0/lib -L/usr/local/Cellar/cairo/1.14.6_1/lib -L/usr/local/Cellar/libsigc++/2.8.0/lib -L/usr/local/Cellar/gdk-pixbuf/2.32.3/lib -L/usr/local/Cellar/glib/2.46.2/lib -L/usr/local/opt/gettext/lib -lgtkmm-3.0 -latkmm-1.6 -lgdkmm-3.0 -lgiomm-2.4 -lpangomm-1.4 -lglibmm-2.4 -lgtk-3 -lgdk-3 -lpangocairo-1.0 -lpango-1.0 -latk-1.0 -lcairo-gobject -lgio-2.0 -lcairomm-1.0 -lcairo -lsigc-2.0 -lgdk_pixbuf-2.0 -lgobject-2.0 -lglib-2.0 -lintl']

SOURCE_EXTENSIONS = [
    '.cpp',
    '.cxx',
    '.cc',
    '.c',
    '.m',
    '.mm'
]

HEADER_EXTENSIONS = [
    '.h',
    '.hxx',
    '.hpp',
    '.hh'
]

def IsHeaderFile(filename):
    extension = os.path.splitext(filename)[1]
    return extension in HEADER_EXTENSIONS

def GetCompilationInfoForFile(database, filename):
    if IsHeaderFile(filename):
        basename = os.path.splitext(filename)[0]
        for extension in SOURCE_EXTENSIONS:
            replacement_file = basename + extension
            if os.path.exists(replacement_file):
                compilation_info = database.GetCompilationInfoForFile(replacement_file)
                if compilation_info.compiler_flags_:
                    return compilation_info
        return None
    return database.GetCompilationInfoForFile(filename)

def FindNearest(path, target):
    candidate = os.path.join(path, target)
    if(os.path.isfile(candidate) or os.path.isdir(candidate)):
        logging.info("Found nearest " + target + " at " + candidate)
        return candidate;
    else:
        parent = os.path.dirname(os.path.abspath(path));
        if(parent == path):
            raise RuntimeError("Could not find " + target);
        return FindNearest(parent, target)

def MakeRelativePathsInFlagsAbsolute(flags, working_directory):
    if not working_directory:
        return list(flags)
    new_flags = []
    make_next_absolute = False
    path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
    for flag in flags:
        new_flag = flag

        if make_next_absolute:
            make_next_absolute = False
            if not flag.startswith('/'):
                new_flag = os.path.join(working_directory, flag)

        for path_flag in path_flags:
            if flag == path_flag:
                make_next_absolute = True
                break

            if flag.startswith(path_flag):
                path = flag[ len(path_flag): ]
                new_flag = path_flag + os.path.join(working_directory, path)
                break

        if new_flag:
            new_flags.append(new_flag)
    return new_flags


def FlagsForClangComplete(root):
    try:
        clang_complete_path = FindNearest(root, '.clang_complete')
        clang_complete_flags = open(clang_complete_path, 'r').read().splitlines()
        return clang_complete_flags
    except:
        return None

def FlagsForInclude(root):
    try:
        include_path = FindNearest(root, 'include')
        flags = []
        for dirroot, dirnames, filenames in os.walk(include_path):
            for dir_path in dirnames:
                real_path = os.path.join(dirroot, dir_path)
                flags = flags + ["-I" + real_path]
        return flags
    except:
        return None

def FlagsForCompilationDatabase(root, filename):
    try:
        compilation_db_path = FindNearest(root, 'compile_commands.json')
        compilation_db_dir = os.path.dirname(compilation_db_path)
        logging.info("Set compilation database directory to " + compilation_db_dir)
        compilation_db =  ycm_core.CompilationDatabase(compilation_db_dir)
        if not compilation_db:
            logging.info("Compilation database file found but unable to load")
            return None
        compilation_info = GetCompilationInfoForFile(compilation_db, filename)
        if not compilation_info:
            logging.info("No compilation info for " + filename + " in compilation database")
            return None
        return MakeRelativePathsInFlagsAbsolute(
            compilation_info.compiler_flags_,
            compilation_info.compiler_working_dir_)
    except:
        return None

def FlagsForFile(filename):
    root = os.path.realpath(filename);
    compilation_db_flags = FlagsForCompilationDatabase(root, filename)
    if compilation_db_flags:
        final_flags = compilation_db_flags
    else:
        final_flags = BASE_FLAGS
        clang_flags = FlagsForClangComplete(root)
        if clang_flags:
            final_flags = final_flags + clang_flags
        include_flags = FlagsForInclude(root)
        if include_flags:
            final_flags = final_flags + include_flags
    return {
        'flags': final_flags,
        'do_cache': True
    }
