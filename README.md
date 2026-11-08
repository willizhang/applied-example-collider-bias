# Applied example

[![DOI](https://zenodo.org/badge/1124784388.svg)](https://doi.org/10.5281/zenodo.24054707)

This repository includes R scripts for the applied example in Mathur et al. (2026), ***A mechanistic characterization of missingness at random*** (In Preparation).

## File structure

``` text
applied-example-collider-bias/
├── 00_generate_pseudo_data.R
├── 01-SPHC-2010-2014.Rmd
├── 02-SPHC-2010-2021.Rmd
├── 03-SPHC-2014-2021.Rmd
├── 04-forest-plot.Rmd
```

## How to run the code

There are two alternative ways to run the analyses.

### Option 1: Users with authorized access to the SPHC data

Run:

1.  `01-SPHC-2010-2014.Rmd`
2.  `02-SPHC-2010-2021.Rmd`
3.  `03-SPHC-2014-2021.Rmd`
4.  `04-forest-plot.Rmd`

### Option 2: Users without access to the SPHC data

To demonstrate the functionality of the analysis code:

1.  Run `00_generate_pseudo_data.R` to generate a synthetic pseudo-dataset in the R environment.
2.  Run `01-SPHC-2010-2014.Rmd` using the generated pseudo-dataset.

The pseudo-data are provided only for `01-SPHC-2010-2014.Rmd` for illustrative purposes. Both scripts should be executed in the same R session so that the generated pseudo-dataset remains available in the R environment.

## Outputs

1.  `01-SPHC-2010-2014.Rmd` produces:\
    Complete-case analysis and MICE results for SPHC 2010, followed from 2010 to 2014.

2.  `02-SPHC-2010-2021.Rmd` produces:\
    Complete-case analysis and MICE results for SPHC 2010, followed from 2010 to 2021.

3.  `03-SPHC-2014-2021.Rmd` produces:\
    Complete-case analysis and MICE results for SPHC 2014, followed from 2014 to 2021.

4.  `04-forest-plot.Rmd` produces:\
    `forest_plot_male.svg` — Figure 7a.\
    `forest_plot_female.svg` — Figure 7b.

The forest plots are generated using numerical results from the original SPHC analyses embedded in `04-forest-plot.Rmd`.

## Data availability

The Stockholm Public Health Cohort (SPHC) data used in the applied example are not publicly available because access is subject to [data protection and SPHC data-access requirements](https://www.ces.regionstockholm.se/projekt-och-uppdrag/halsa-stockholm/SPHC-data/).

To illustrate the functionality of the analysis code, we provide `00_generate_pseudo_data.R`, which generates a fully synthetic pseudo-dataset for the SPHC 2010 cohort followed up to 2014. The sample size, variable distributions, associations, and missing-data patterns are arbitrarily specified and do not represent those in the original SPHC data. The pseudo-dataset is intended solely to demonstrate the analytical workflow and cannot be used to reproduce the numerical results reported in the article.
