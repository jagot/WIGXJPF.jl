using BinDeps

@BinDeps.setup

libwigxjpf = library_dependency("libwigxjpf")

prefix = joinpath(BinDeps.depsdir(libwigxjpf), "usr")
src_dir = joinpath(BinDeps.depsdir(libwigxjpf), "src", "WIGXJPF")
build_dir = joinpath(BinDeps.depsdir(libwigxjpf), "builds", "WIGXJPF")

provides(SimpleBuild,
         (@build_steps begin
          CreateDirectory(build_dir)
          @build_steps begin
          ChangeDirectory(build_dir)
          @build_steps begin
          `cmake -DCMAKE_INSTALL_PREFIX="$prefix" $src_dir`
          `make`
          `make install`
          end
          end
          end),
         libwigxjpf)
@BinDeps.install Dict([(:libwigxjpf, :_jl_libwigxjpf)])
