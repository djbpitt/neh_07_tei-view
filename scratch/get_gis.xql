xquery version "3.1";
(: find all elements in TEI <text> and create typeswitch skeleton; 
 : assumes TEI input namespace 
 : assumes HTML output namespace
 : :)
declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare option output:method "text";
declare variable $texts as element(tei:text)+ := collection('/db/apps/neh_07_tei-view/xml')//tei:text;
declare variable $gis := $texts//* ! name() => distinct-values() => sort();
declare function local:create_case_statements($gis) as xs:string {
    string-join(
        (for $gi in $gis
        return
            concat('        case element(tei:', $gi, ') return local:', $gi, '($node)')),
        '&#x0a;'
    )
};
string-join(
    (
        'declare default element namespace "http://www.w3.org/1999/xhtml";',
        'declare namespace tei = "http://www.tei-c.org/ns/1.0";',
        'declare function local:dispatch($node as node()) as item()* {
    typeswitch($node)
        case text() return $node',
        local:create_case_statements($gis),
        '        default return local:passthru($node)',
        '};'),
        '&#x0a;') || '&#x0a;' ||
string-join(
(for $gi in $gis
return
concat(
    '&#x0a;declare function local:',$gi,'($node as element(tei:',$gi,')) as element() {&#x0a;',
    '    <GI>{local:passthru($node)}</GI>',
    '};')
,
'&#x0a;declare function local:passthru($node as node()) as item()* {
    for $child in $node/node() return local:dispatch($child)
};'
), '&#x0a;')


