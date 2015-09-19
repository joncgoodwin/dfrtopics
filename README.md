# HathiTrust

This is a minor fork of Andrew Goldstone's [dfrtopics](https://github.com/agoldst/dfrtopics) that adds some functions to handle the HathiTrust data released by [Ted Underwood](http://sharc.hathitrust.org/genre).

Assuming that you have "fiction-metadata.csv" and "tsv" as the metadata file and data directory, respectively, you can create a model with:

```R
m <- model_hathi_documents("fiction-metadata.csv", "tsv", stoplist_file="stopwords.txt", n_topics=200)
```

You would also need a "stopwords.txt" file in the same directory. The HathiTrust files are generally quite large, so I recommend using at least this much memory before you load the library:

```R
options(java.parameters="-Xmx4g")
```

(Doubling that if you have the memory might not be a bad idea.) After you have created the model, you can export it for Andrew Goldstone's [dfrbrowser](https://github.com/agoldst/dfr-browser) with the following:

```R
export_ht_browser_data(m, out_dir="data")
```


Some tweaks are necessary to get the browser to display the Hathi metadata correctly, and I will release those soon.

It's quite possible that the changes I have made here will cause this code to break in unknown, unknowable, and perhaps spectacular ways, so please use with caution.

# dfrtopics

This small R package provides bits and pieces to help make and explore topic models of text, especially word-count data like that available from JSTOR's [Data for Research](http://dfr.jstor.org) (DfR) service. It uses [MALLET](http://mallet.cs.umass.edu) to run the models.

I wrote most of the bits and pieces here while working on my research (I am a literary scholar), so this is not meant to be a professional, sophisticated, multipurpose tool. Nonetheless, by now it seemed worth it to make some of what I'd done conceivably reusable by others who might also want to explore topic models even if, like me, like to use R and have only very rudimentary knowledge of machine learning. The code skews to my amateurishness as a programmer. It is all very much in-progress, hacked together, catch-as-catch-can, I am not an expert, I am not a lawyer, etc., etc., etc. Use and share freely, at your own risk. 

Every function has online help in R. For a fairly detailed introduction to what you can do with this package, see the introductory vignette:  `vignette("introduction", "dfrtopics")` or [online here](http://agoldst.github.io/dfrtopics/introduction.html). I'm always happy to hear from anyone who makes use of this.

## Installation

This is too messy for CRAN. The easiest way to install is to first install the [devtools](http://cran.r-project.org/web/packages/devtools/index.html) package, and then use it to install this package straight from github:

```R
library(devtools)
install_github("agoldst/dfrtopics")
```

(To install this version, use:)

```R
library(devtools)
install_github("joncgoodwin/dfrtopics")
```

(This should work even if you don't have git or a github account.)

I have been profligate with dependencies. Note that if you use RStudio, getting rJava and mallet to load can be a messy business. See my [blog post on rJava and RStudio on MacOS X](http://andrewgoldstone.com/blog/2015/02/03/rjava/).

## Browsing the model interactively

Now in alpha release: another project of mine, [dfr-browser](http://agoldst.github.io/dfr-browser), which makes topic models of DfR data into a javascript-based interactive browser. To export results from this model as a browser, use the package function `export_browser_data` (see the function documentation for more detail).

## A note on licensing

I have decided to apply the [MIT License](https://github.com/agoldst/dfr-analysis/tree/master/LICENSE) to this repository. That means you can pretty much do anything you want with it, provided you attribute stuff by me to me. And you can't hold me liable. I prefer the spirit of the GNU Public License, but I would like academics who use this code to be able to do so without being obliged to release their source, since that it is not always possible. I don't attempt to forbid commercial uses, but I don't welcome them.

## Running the package tests

The tests are based on a sample set of data from DfR. I do not currently have permission to distribute that data, but you can recreate it if you wish to run the tests or regenerate the package vignette. Perform [this search in DfR](http://dfr.jstor.org/fsearch/submitrequest?cs=jo%3A%28pmla+OR+%22modern+philology%22%29+AND+year%3A%5B1905+TO+1915%5D+AND+ty%3Afla%5E1.0&fs=yrm1&view=text&) and make a Dataset Request for wordcounts and metadata in CSV format. Then unzip the archive to a directory `test-data` inside the package directory for `dfrtopics`.

## Version history

v0.2
 :  New release, September 2015. An almost completely rewritten API, so don't expect backwards compatibility. This version should be more flexible and easier to use. At least it has more documentation.

v0.1
 :  Earliest public version(s), 2013--2015

Andrew Goldstone (<andrew.goldstone@rutgers.edu>)
