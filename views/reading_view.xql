xquery version "3.1";
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
    <p>{local:passthru($node)}</p>};

declare function local:bibl($node as element(tei:bibl)) as element() {
    (: only example is attribution immediately after a quote, so inline:)
    (' (', local:passthru($node), ')')
};

declare function local:body($node as element(tei:body)) as element() {
    <section id="body">{local:passthru($node)}</section>};

declare function local:cit($node as element(tei:cit)) as element() {
    (: only example is inline :)
    <q>{local:passthru($node)}</q>};

declare function local:closer($node as element(tei:closer)) as element() {
    <span class="closer">{local:passthru($node)}</span>};

declare function local:date($node as element(tei:date)) as element() {
    <span class="date">{local:passthru($node)}</span>};

declare function local:div($node as element(tei:div)) as element() {
    <div>{local:passthru($node)}</div>};

declare function local:emph($node as element(tei:emph)) as element() {
    <em>{local:passthru($node)}</em>};

declare function local:head($node as element(tei:head)) as element() {
    (: TODO: currently just <h1>, need to adjust GI to depth of nesting :)
    <h1>{local:passthru($node)}</h1>};

declare function local:interp($node as element(tei:interp)) as element() {
    <span class="interp">{local:passthru($node)}</span>};

declare function local:lb($node as element(tei:lb)) as element() {
    (: empty :)
    <lb/>
};

declare function local:name($node as element(tei:name)) as element() {
    <span class="name">{local:passthru($node)}</span>};

declare function local:note($node as element(tei:note)) as element() {
    (: only instance is inline parenthetical phrase from the original:)
    (' (', local:passthru($node), ')')};

declare function local:opener($node as element(tei:opener)) as element() {
    <span class="opener">{local:passthru($node)}</span>};

declare function local:p($node as element(tei:p)) as element() {
    <p>{local:passthru($node)}</p>};

declare function local:pb($node as element(tei:pb)) as element() {
    (: empty :)
    <pb/>
};

declare function local:persName($node as element(tei:persName)) as element() {
    <span class="persName">{local:passthru($node)}</span>};

declare function local:placeName($node as element(tei:placeName)) as element() {
    <span class="placeName">{local:passthru($node)}</span>};

declare function local:q($node as element(tei:q)) as element() {
    <q>{local:passthru($node)}</q>};

declare function local:quote($node as element(tei:quote)) as element() {
    <q>{local:passthru($node)}</q>};

declare function local:ref($node as element(tei:ref)) as element() {
    <a href="{@source}">{local:passthru($node)}</a>};

declare function local:rs($node as element(tei:rs)) as element() {
    (: not yet functional; need to create working @href values :)
    <a href="#{@ref}">{local:passthru($node)}</a>};

declare function local:salute($node as element(tei:salute)) as element() {
    <span class="salute">{local:passthru($node)}</span>};

declare function local:sic($node as element(tei:sic)) as element() {
    <span class="sic">{local:passthru($node)}</span>};

declare function local:signed($node as element(tei:signed)) as element() {
    <span class="signed">{local:passthru($node)}</span>};

declare function local:soCalled($node as element(tei:soCalled)) as element() {
    <span class="soCalled">{local:passthru($node)}</span>};

declare function local:title($node as element(tei:title)) as element() {
    if ($node/parent::*) 
    then <h1>{local:passthru($node)}</h1>
    else <cite>{local:passthru($node)}</cite>};

declare function local:passthru($node as node()) as item()* {
    for $child in $node/node() return local:dispatch($child)
};
request:set-attribute('html', local:dispatch(request:get-data()))
