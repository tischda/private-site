<!-- $Id: xinclude.mod 101 2005-11-27 16:09:07Z dtischer $ -->

<!-- in Cocoon you need to define the namespace again, and it must be 2001 ! -->

<!ELEMENT xi:include (xi:fallback?) >
<!ATTLIST xi:include
    xmlns:xi   CDATA       #FIXED    "http://www.w3.org/2001/XInclude"
    href       CDATA       #REQUIRED
    parse      (xml|text)  "xml"
    encoding   CDATA       #IMPLIED >
<!ELEMENT xi:fallback ANY>
<!ATTLIST xi:fallback
    xmlns:xi   CDATA   #FIXED   "http://www.w3.org/2001/XInclude" >