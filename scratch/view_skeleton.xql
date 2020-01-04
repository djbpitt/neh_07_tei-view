declare default element namespace "http://www.w3.org/1999/xhtml";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare function local:dispatch($node as node()) as item()* {
    typeswitch($node)
        case text() return $node
        case element(tei:ab) return local:ab($node)
        case element(tei:bibl) return local:bibl($node)
        case element(tei:body) return local:body($node)
        case element(tei:cit) return local:cit($node)
        case element(tei:closer) return local:closer($node)
        case element(tei:date) return local:date($node)
        case element(tei:div) return local:div($node)
        case element(tei:emph) return local:emph($node)
        case element(tei:head) return local:head($node)
        case element(tei:interp) return local:interp($node)
        case element(tei:lb) return local:lb($node)
        case element(tei:name) return local:name($node)
        case element(tei:note) return local:note($node)
        case element(tei:opener) return local:opener($node)
        case element(tei:p) return local:p($node)
        case element(tei:pb) return local:pb($node)
        case element(tei:persName) return local:persName($node)
        case element(tei:placeName) return local:placeName($node)
        case element(tei:q) return local:q($node)
        case element(tei:quote) return local:quote($node)
        case element(tei:ref) return local:ref($node)
        case element(tei:rs) return local:rs($node)
        case element(tei:salute) return local:salute($node)
        case element(tei:sic) return local:sic($node)
        case element(tei:signed) return local:signed($node)
        case element(tei:soCalled) return local:soCalled($node)
        case element(tei:title) return local:title($node)
        default return local:passthru($node)
};

declare function local:ab($node as element(tei:ab)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:bibl($node as element(tei:bibl)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:body($node as element(tei:body)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:cit($node as element(tei:cit)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:closer($node as element(tei:closer)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:date($node as element(tei:date)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:div($node as element(tei:div)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:emph($node as element(tei:emph)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:head($node as element(tei:head)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:interp($node as element(tei:interp)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:lb($node as element(tei:lb)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:name($node as element(tei:name)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:note($node as element(tei:note)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:opener($node as element(tei:opener)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:p($node as element(tei:p)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:pb($node as element(tei:pb)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:persName($node as element(tei:persName)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:placeName($node as element(tei:placeName)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:q($node as element(tei:q)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:quote($node as element(tei:quote)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:ref($node as element(tei:ref)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:rs($node as element(tei:rs)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:salute($node as element(tei:salute)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:sic($node as element(tei:sic)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:signed($node as element(tei:signed)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:soCalled($node as element(tei:soCalled)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:title($node as element(tei:title)) as element() {
    <GI>{local:passthru($node)}</GI>};

declare function local:passthru($node as node()) as item()* {
    for $child in $node/node() return local:dispatch($child)
};