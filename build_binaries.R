if (interactive()) {
  unlink("packages", recursive = TRUE, force = TRUE)
  unlink("packages_src", recursive = TRUE, force = TRUE)
}

### ---------------------------------------------------- ###

drat.builder::build(install = TRUE, no_commit = TRUE) ## no_fetch = TRUE

pkgs <- drat.builder:::read_packages()

binPkgs <- apply(pkgs, 1, function(p) {
  pkg <- p["path_pkg"]
  devtools::install_dev_deps(pkg, dependencies = TRUE, upgrade = FALSE) # shouldn't be necessary using drat.builder(install = TRUE)
  devtools::build(pkg = pkg, path = "packages", binary = TRUE)
})

os <- switch(Sys.info()["sysname"],
             Darwin = "macOS",
             Linux = "Linux",
             Windows = "Windows",
             "other")
drat::insertPackages(binPkgs, repodir = ".",
                     commit = paste("add latest binary packages for", os),
                     action = "archive", pullfirst = TRUE)
