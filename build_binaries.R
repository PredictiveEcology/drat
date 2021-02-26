if (interactive()) {
  unlink(c("packages", "packages_src"), recursive = TRUE)
  drat.builder::build(install = TRUE, no_commit = TRUE) ## no_fetch = TRUE
}

### ---------------------------------------------------- ###

pkgs <- drat.builder:::read_packages()

binPkgs <- apply(pkgs, 1, function(p) {
  pkg <- p["path_pkg"]
  devtools::install_dev_deps(pkg, dependencies = TRUE) # shouldn't be necessary using drat.builder(install = TRUE)
  devtools::build(pkg = pkg, path = "packages", binary = TRUE)
})

drat::insertPackages(binPkgs, repodir = ".", action = "archive")
