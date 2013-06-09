============================================================================
private-site
============================================================================

Overview
--------
Generates a static web site from XML via XSLT transformation.

.
├── bin                win/linux binaries (nox-tools) and link checker (xenu)
├── catalog.xml        XML catalog to resolve DTDs
├── dtd                DTDs for XHTML and our custom XML
├── res                resources to be copies "as-is" to the site root
├── xml                XML source files
└── xslt               XSLT transformations


Sources
-------
git clone git://github.com/tischda/properties-maven-plugin.git


Quickstart
----------
bin\clean.cmd       --> deletes 'dist' output directory
bin\dist.cmd        --> generates the site for apache
bin\dist-local.cmd  --> generates the site for local browsing (file system)

Examples:

  bin\dist.cmd -f     --> force re-generation
  bin\dist.cmd -p prefix http://somesite/url/prefix     --> change prefix


Documentation
-------------
README.txt  - This file
CHANGES.txt - Change history
