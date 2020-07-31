# ieee_doi2pdf

Downloads the pdf from IEEEXplore from the DOI of the publication.


I've created this script to download a few papers I need for my work from home during the COVID-19 lockdown. As far as I know mass PDF download is not allowed from IEEEXplore without prior permission (like scientific data mining of the research articles), so use it at your own responsibility.


# Usage
```bash
ieee_doi2pdf <DOI> <PDF_FILE>
```

Though "https://doi.org" at the beginning of the DOI is not allowed according to the DOI standard, but some sites use them. The script accepts both pure DOI and the direct URL as well.

Specifying a PDF_FILE is not necessary. If it is omitted, the IEEEE ID of the article will be used as the basename of the output pdf.
