## External libraries (eg RItools) as submodules

The RItools repository is cloned in /src, as a git submodule.  To set this up, after the first
time you pull in this change (or after initially cloning this repo),
you should `cd` to this directory and do the following:

```
$ git submodule
```
Issuing this command should result in a line with a long hash code and
the word "RItools", the hash possibly preceded by a "-".  If that is
the case, then go on to do:

```
$ git submodule init RItools
$ git submodule update RItools
```

## installing and loading the external packages

First, create a `lib` subdirectory of `RItools`.  This is where the
installed version of the package will go.

Next, I recommend installing the `devtools` and `withr` packages,
available from CRAN.  After that you can do (specifying file names relative
to the directory this file lives in, `RItools/src`):

```{r}
library(devtools)
library(withr)
with_libpaths("../lib/", install("./RItools"))
```

Once that's done, you'll be able to load the library with

```{r}
library(RItools, lib.loc="../lib/") 
```

Something to look out for: if you have a stable version of RItools
installed system- or user-wide, then whenever you forget the `lib.loc`
part of the above command you'll get that version rather than the
development version.  I'm not sure what the best way to circumvent
this subtle source of coding issues may be, but a sure-fire way to get
around it is to remove any system or user-wide installs of RItools.
That way you'll get an error when you type `library(RItools)`, and
you'll remember your mistake and fix it.
