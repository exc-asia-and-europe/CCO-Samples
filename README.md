# CCO Examples in VRA Core 4.0

## Aims

This project aims to make available all [Cataloging Cultural Objects examples](http://cco.vrafoundation.org/index.php/toolkit/index_of_examples/), including the figures in the book, in the data standard of [VRA Core](http://www.core.vraweb.org/index.html).

A table of all finished records can be found [here](https://docs.google.com/spreadsheets/d/1ClChQ71BNv5MkGBhJx-_7XUzooTRJnspFxMBbYUy7nc/edit?usp=sharing), along with links to the examples on the CCO website, links to their CONA and VRA Core records if given, and their geographical areas, timeframes and repositories listed. Those examples not yet available on the website have also been noted.

## General method

If there is an image record, it is found within the file of the work record it is an image of for purposes of validation. Related work records have similiarly been attached. (Please see [relation](https://docs.google.com/spreadsheets/d/1ClChQ71BNv5MkGBhJx-_7XUzooTRJnspFxMBbYUy7nc/edit?usp=sharing) column for details.)

Vocabularies and codes used:
- [Getty Vocabularies:](http://www.getty.edu/research/tools/vocabularies/index.html)
  - Art & Architecture Thesaurus® Online ("aat")
  - Cultural Objects Name Authority® Online ("cona")
  - Getty Thesaurus of Geographic Names® Online ("tgn")
  - The Getty Iconography Authority (IA) ("icon")
- [The Virtual International Authority File ("viaf")](https://viaf.org/)
- [Iconclass ("iconclass")](http://www.iconclass.org/)
- [Gemeinsame Normdatei ("gnd")](https://wiki.bsz-bw.de/doku.php?id=v-team:recherche:ognd:start)
- [Library of Congress Subject Headings ("lcsh")](http://id.loc.gov/authorities/subjects.html)
- [MARC Code List for Relators ("marcrelator")](https://www.loc.gov/marc/relators/relaterm.html)

## Issues

Wherever possible, this project aims to include all information from the repositories in addition to what is given in the Examples. This has led to some issues of uncertainty.

### Exhibition

Although both Date and Location posses a type="exhibition", the link between certain dates and locations cannot be made more specific. To counter this, a general exhibition information has been inserted into the Description field, and the names of the exhibitions usually along with the dates have been inserted into the location refid subelement, with type="other".

### Provenance

As there is currently no separate set for provenance, or a type in the DateSet to show when an object enters a collection, this information has been included in the Description. Please see former owners for other observations.

### Subject

The subject types in the CCO examples, like in Example 11, have not been incorporated because of VRA Core's own types for subjects. 

### Relation

The relation of architectural works to those earlier constructs they had replaced could not be properly expressed. (Example 152)

### Textref

Fortunately, many institutions give the visitor ample information on textual sources concerning the cultural object in their care. However, these have most often proven to be too much information for this project, and as such, their incorporation was more often than not neglected.

### Depicted persons, locations, patrons and former owners

According to the VRA Core Element Description, the agents listed in the AgentSet have "contributed to the design, creation, production, manufacture, or alteration of the work or image." It may be argued that patrons belong to this defintion.

#### Depicted persons

Identifiable depicted persons have been made part of the subjectSet, in line with the CCO Examples and the general logic of the VRA Core. However, this doesn't allow for a precise definition of their role with or without a controlled vocabulary like the marcrelator, as their listing in the agentSet would. It also omits any dates associated with them.

#### Depicted locations

Currently there is no clearly defined way to include the location of buildings or general views. For the purposes of this project, these have been included in the locationSet as type="other".

#### Former owners

Although the locationSet allows for the type of formerOwner, this is optimized for repositories that have or had a known location. In case of persons, however, the exact location of the object in their property isn't neccessarily available, and there is no place to attach dates associated with the person(s).

### Conditions

Currently there exists no separate category for describing an object's current condition, events of restoration, vandalism or alterations. This data has been recorded in the descriptions, and where possible in the dateSet.

### Writing styles/calligraphic hands

Currently there is no proper place to note styles of writing or calligraphy for a cultural object.

### Dating of description texts

As the dataDate global attribute refers only to the date when information was entered into the record, there is no method of assigning dates to the creation of information being incorporated, such as when a catalogue entry was written by an author.

### Credit lines

With some hesitation, credit lines have been incorporated into the RightsSet.
