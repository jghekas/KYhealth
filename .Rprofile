## This will override a .Rprofile you have set up in your home directory
## User-specific modifications can be put in `Rprofile-env-vars.R`.
## Despite the name it should be OK to have general .Rprofile code
## in there, not just code defining environment variables.
##
## To ensure that this file is read in,
## (a) make sure the environment variable `R_PROFILE_USER`
## is *not* set.  To check on linux, unix or Mac Terminal,
## enter $R_PROFILE_USER at the command line.  It should return
## a blank line or two, but not the location of a file.
## (b) start R from within this directory.  Make sure not to give
## options `--no-init-file` or `--no-environ`.

if (file.exists("Rprofile-env-vars.R"))
    {
        source("Rprofile-env-vars.R")
    } else warning("Could not find ./Rprofile-env-vars.R; proceeding")


