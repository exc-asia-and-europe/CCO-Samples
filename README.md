# CCO Examples in VRA Core 4.0

## Aims

This project aims to make available all Cataloging Cultural Objects examples ( http://cco.vrafoundation.org/index.php/toolkit/index_of_examples/ ) in the data standard of VRA Core ( http://www.core.vraweb.org/index.html ).

## Problems

Wherever possible, this project aims to include all information from the repositories in addition to what is given in the Examples. This has led to some issues of uncertainty.

### Exhibition

Although both Date and Location posses a type="exhibition", the link between certain dates and locations cannot be made more specific. To counter this, a general exhibition information has been inserted into the Description field, and the names of the exhibitions usually along with the dates have been inserted into the location refid subelement, with type="other".

### Provenance

As there is currently no separate set for provenance, this information has been included in the Description.

### Subject

The subject types in the CCO examples, like in Example 11, have not been incorporated because of VRA Core's own types for subjects. 

### Textref

Fortunately, many institutions give the visitor ample information on textual sources concerning the cultural object in their care. However, these have most often proven to be too much information for this project, and as such, their incorporation was more often than not neglected.

# CCO-Samples

To "clean up" the data files you can use ant (with build.xml for "data_old" or build_new.xml for "data_new") with the default target or run the xslt-files in the following order:

1. cleanup-basic.xsl
1. cleanup-types.xsl
1. cleanup-source.xsl
1. cleanup-sort.xsl
1. cleanup-dates.xsl
1. cleanup-sets.xsl
1. cleanup-empty.xsl
1. cleanup-basic.xsl
